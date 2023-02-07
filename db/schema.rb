# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "grommet_gifts_categories", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.string "category"
    t.string "sub_category"
    t.string "category_url"
    t.string "clean_category"
    t.boolean "need_story", default: false
    t.index ["category", "sub_category"], name: "unique_cat", unique: true
    t.index ["category_url"], name: "grommet_gifts_categories_category_url_uindex", unique: true
  end

  create_table "grommet_product_categories", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "product_category_id"
    t.index ["product_id", "product_category_id"], name: "unique_cat", unique: true
  end

  create_table "grommet_product_keywords", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.string "keyword"
    t.string "category_url"
    t.boolean "done", default: false
    t.index ["keyword"], name: "uniq_keyword", unique: true
  end

  create_table "grommet_product_to_keyword", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "keyword_id"
    t.index ["product_id", "keyword_id"], name: "unique_key", unique: true
  end

  create_table "grommet_products", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.string "producer_name"
    t.string "product_name"
    t.text "product_short_description"
    t.string "product_price_min"
    t.string "product_price_max"
    t.string "is_sold_out"
    t.integer "rating"
    t.integer "reviews_count"
    t.string "product_img_url"
    t.string "product_url"
    t.string "product_highlights", limit: 511
    t.string "product_type_id"
    t.string "product_brand_name"
    t.string "grommet_category"
    t.text "product_description", size: :medium
    t.text "json_general", size: :medium
    t.text "json_big", size: :medium
    t.string "data_source_url", default: "https://www.thegrommet.com/gifts"
    t.string "created_by", default: "Maxim G."
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.string "md5_hash"
    t.index ["md5_hash"], name: "md5", unique: true
  end

end
