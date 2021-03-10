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

ActiveRecord::Schema.define(version: 2021_03_08_170121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "intro"
    t.text "description"
    t.datetime "date"
    t.string "main_photo"
    t.float "latitude"
    t.float "longitude"
    t.integer "deposit"
    t.string "available"
    t.integer "minimum_stay_in_months"
    t.integer "room_size_m2"
    t.integer "apartment_size_m2"
    t.string "bed_type"
    t.integer "bathrooms_number"
    t.integer "flatmates_female", default: 0
    t.integer "flatmates_male", default: 0
    t.integer "min_preferred_flatmate_age", default: 18
    t.integer "max_preferred_flatmate_age"
    t.boolean "preferred_flatmate_is_male"
    t.boolean "preferred_flatmate_is_female"
    t.boolean "is_wifi"
    t.boolean "is_tv"
    t.boolean "is_washing_machine"
    t.boolean "is_lift"
    t.boolean "is_furniture"
    t.boolean "is_terrace"
    t.boolean "is_balcony"
    t.boolean "is_garden"
    t.boolean "is_parking"
    t.boolean "is_private_bathroom"
    t.boolean "is_dishwasher"
    t.boolean "is_pet_friendly"
    t.boolean "is_smoker_friendly"
    t.boolean "is_couples_friendly"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "propertytype"
    t.string "address"
    t.integer "rent_cents", default: 0, null: false
    t.string "status", default: "active"
    t.bigint "user_id"
    t.string "city"
    t.string "neighborhood"
    t.string "preferred_gender", default: "Ei oma tähtsust"
    t.integer "bedroomnumber", default: 1
    t.integer "bathroomnumber", default: 1
    t.boolean "is_desk", default: false
    t.integer "maximum_stay_in_months", default: 12
    t.string "available_until", default: ""
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "state"
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "apartment_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pending"
    t.string "description", default: ""
    t.index ["apartment_id"], name: "index_bookings_on_apartment_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apartments", "users"
  add_foreign_key "bookings", "apartments"
  add_foreign_key "bookings", "users"
end
