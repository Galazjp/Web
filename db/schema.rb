# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_27_210535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pet_types", force: :cascade do |t|
    t.bigint "type_id"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_types_on_pet_id"
    t.index ["type_id"], name: "index_pet_types_on_type_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "names"
    t.date "date_of_birth"
    t.float "rating"
    t.bigint "user_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["location_id"], name: "index_pets_on_location_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "phrases", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phrases_on_user_id"
  end

  create_table "review_topics", force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_topics_on_review_id"
    t.index ["topic_id"], name: "index_review_topics_on_topic_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.float "rating"
    t.bigint "pet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_reviews_on_pet_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "names"
    t.string "lastnames"
    t.date "date_of_birth"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "pet_types", "pets"
  add_foreign_key "pet_types", "types"
  add_foreign_key "pets", "locations"
  add_foreign_key "pets", "users"
  add_foreign_key "phrases", "users"
  add_foreign_key "review_topics", "reviews"
  add_foreign_key "review_topics", "topics"
  add_foreign_key "reviews", "pets"
  add_foreign_key "reviews", "users"
end
