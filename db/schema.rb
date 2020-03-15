# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_15_102447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_events", force: :cascade do |t|
    t.datetime "datetime"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
  end

  create_table "articles", force: :cascade do |t|
    t.string "author_name"
    t.string "title"
    t.string "description"
    t.string "body"
    t.string "cover_image"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "email"
    t.integer "phone_number"
    t.string "location"
    t.boolean "is_office", default: false, null: false
    t.boolean "is_organisation", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.datetime "datetime"
    t.string "name"
    t.string "description"
    t.string "location"
    t.integer "price"
    t.string "external_link"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_id"], name: "index_events_on_entity_id"
  end

  create_table "keywordings", force: :cascade do |t|
    t.bigint "keyword_id", null: false
    t.string "keywordable_type"
    t.integer "keywordable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["keyword_id"], name: "index_keywordings_on_keyword_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majorings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "major_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["major_id"], name: "index_majorings_on_major_id"
    t.index ["user_id"], name: "index_majorings_on_user_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "entity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_id"], name: "index_organizations_on_entity_id"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "email"
    t.integer "phone_number"
    t.integer "price"
    t.bigint "user_id", null: false
    t.string "category"
    t.string "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_promotions_on_user_id"
  end

  create_table "student_wires", force: :cascade do |t|
    t.string "contact"
    t.string "title"
    t.string "body"
    t.string "cover_image"
    t.string "external_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "user_class"
  end

  add_foreign_key "events", "entities"
  add_foreign_key "keywordings", "keywords"
  add_foreign_key "majorings", "majors"
  add_foreign_key "majorings", "users"
  add_foreign_key "organizations", "entities"
  add_foreign_key "organizations", "users"
  add_foreign_key "promotions", "users"
end
