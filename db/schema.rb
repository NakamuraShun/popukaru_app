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

ActiveRecord::Schema[7.0].define(version: 2024_03_30_055953) do
  create_table "article_tag_relations", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_tag_relations_on_article_id"
    t.index ["tag_id"], name: "index_article_tag_relations_on_tag_id"
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.text "title", null: false
    t.text "lead", null: false
    t.text "content", null: false
    t.text "mv_path", null: false
    t.string "meta_title", null: false
    t.string "meta_keyword", null: false
    t.string "meta_description", null: false
    t.bigint "category_id", null: false
    t.bigint "editor_id", null: false
    t.integer "status", limit: 1, null: false
    t.datetime "public_datetime"
    t.datetime "private_datetime"
    t.integer "slider_order", limit: 1, default: 0, null: false
    t.integer "pickup_order", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["editor_id"], name: "index_articles_on_editor_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_ruby", null: false
    t.string "last_name_ruby", null: false
    t.string "organization", null: false
    t.string "position", null: false
    t.string "email", null: false
    t.integer "tel", limit: 1, null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editors", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_ruby", null: false
    t.string "last_name_ruby", null: false
    t.date "birthday"
    t.text "thumb_path", null: false
    t.string "organization", null: false
    t.string "position", null: false
    t.string "lead", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "figure_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_tag_relations", "articles"
  add_foreign_key "article_tag_relations", "tags"
  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "editors"
end
