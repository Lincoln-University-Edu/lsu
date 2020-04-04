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

ActiveRecord::Schema.define(version: 2020_04_04_151643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_events", force: :cascade do |t|
    t.datetime "start_time"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
    t.datetime "end_time"
  end

  create_table "articles", force: :cascade do |t|
    t.string "author_name"
    t.string "title"
    t.string "description"
    t.text "body"
    t.string "cover_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorizings", force: :cascade do |t|
    t.string "categorizable_type"
    t.integer "categorizable_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_categorizings_on_category_id"
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
    t.datetime "start_time"
    t.string "name"
    t.string "description"
    t.string "location"
    t.integer "price"
    t.string "external_link"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "end_time"
    t.index ["entity_id"], name: "index_events_on_entity_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "imagings", force: :cascade do |t|
    t.bigint "image_id"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_imagings_on_image_id"
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

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likings", force: :cascade do |t|
    t.integer "likeable_id"
    t.string "likeable_type"
    t.bigint "like_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["like_id"], name: "index_likings_on_like_id"
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
    t.integer "student_class"
    t.boolean "is_lincoln_press_publisher", default: false, null: false
    t.boolean "is_lincolnian_publisher", default: false, null: false
    t.boolean "is_student_wire_editor", default: false, null: false
    t.boolean "is_student_life_event_publisher", default: false, null: false
    t.boolean "is_academic_event_publisher", default: false, null: false
    t.boolean "is_athletic_event_publisher", default: false, null: false
    t.boolean "completed_registration", default: false, null: false
  end

  add_foreign_key "events", "entities"
  add_foreign_key "keywordings", "keywords"
  add_foreign_key "majorings", "majors"
  add_foreign_key "majorings", "users"
  add_foreign_key "organizations", "entities"
  add_foreign_key "organizations", "users"
  add_foreign_key "promotions", "users"
end
