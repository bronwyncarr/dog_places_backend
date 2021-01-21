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

ActiveRecord::Schema.define(version: 2021_01_21_000013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_comments_on_location_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "type"
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_facilities_on_location_id"
  end

  create_table "location_facility", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "facility_id", null: false
    t.index ["facility_id"], name: "index_location_facility_on_facility_id"
    t.index ["location_id"], name: "index_location_facility_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "type"
    t.string "longitude"
    t.string "latitude"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "locations"
  add_foreign_key "comments", "users"
  add_foreign_key "facilities", "locations"
  add_foreign_key "location_facility", "facilities"
  add_foreign_key "location_facility", "locations"
  add_foreign_key "locations", "users"
end
