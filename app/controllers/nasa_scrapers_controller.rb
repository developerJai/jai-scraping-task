class NasaScrapersController < ApplicationController
  def index
    unparsed_html = HTTParty.get(page_link)
    page = Nokogiri::HTML(unparsed_html)

    node_id = page.search('script').map {|s| s.content.to_s.split("window.forcedRoute = \"").last.to_s.gsub("\"","") if s.content.to_s.include?("window.forcedRoute") }.compact.last
    @result = {}
    if node_id.present?
      options = {
        headers: {
          "Content-Type": "application/json"
        }
      }
      response = HTTParty.get(api_link+node_id, options)
      data =  JSON.parse(response.body)
      source = data["_source"]
      if source.present?
        @result = {
          title: source["title"],
          date: source["promo-date-time"],
          release_no: source["release-id"],
          article: ActionView::Base.full_sanitizer.sanitize(source["body"]).delete!("\n")
        }
      end
    end

    respond_to do |format|
      format.any { render json: { data: @result }}
    end
  end

  private

  def page_link
    'https://www.nasa.gov/press-release/nasa-industry-to-collaborate-on-space-communications-by-2025'
  end

  def api_link
    "https://www.nasa.gov/api/2"
  end
end
