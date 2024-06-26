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

ActiveRecord::Schema.define(version: 2024_05_19_111300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "color"
    t.string "transmission"
    t.string "ac"
    t.integer "max_capacity", default: 4
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price"
    t.text "desc"
    t.integer "odometer"
    t.integer "battery"
    t.string "image_url"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "car_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_favourites_on_car_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "test_drives", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "phone_number", null: false
    t.datetime "desired_time", null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_test_drives_on_car_id"
    t.index ["user_id"], name: "index_test_drives_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cars", "users"
  add_foreign_key "test_drives", "cars"
  add_foreign_key "test_drives", "users"
end
