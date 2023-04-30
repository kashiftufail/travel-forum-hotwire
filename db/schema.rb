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

ActiveRecord::Schema[7.0].define(version: 2023_04_30_110324) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "no_of_persons"
    t.string "email"
    t.string "stay_nights"
    t.string "phone"
    t.text "detail"
    t.datetime "departure_date"
    t.datetime "return_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookings_destinations", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_bookings_destinations_on_booking_id"
    t.index ["destination_id"], name: "index_bookings_destinations_on_destination_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "title"
    t.text "detail"
    t.bigint "tour_id", null: false
    t.integer "stay_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_destinations_on_slug", unique: true
    t.index ["tour_id"], name: "index_destinations_on_tour_id"
  end

  create_table "destinations_packages", force: :cascade do |t|
    t.bigint "destination_id", null: false
    t.bigint "package_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_destinations_packages_on_destination_id"
    t.index ["package_id"], name: "index_destinations_packages_on_package_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "alt_text"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "packages", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "no_of_persons"
    t.index ["slug"], name: "index_packages_on_slug", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "number"
    t.bigint "category_id", null: false
    t.float "price"
    t.integer "quantity_in_hand"
    t.text "detail"
    t.string "size"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "quantity_scale"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "service_requests", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "no_of_night_stays"
    t.string "email"
    t.text "detail"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "service_type"
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.integer "email_after_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string "title"
    t.text "detail"
    t.float "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.boolean "is_active", default: true
    t.index ["slug"], name: "index_tours_on_slug", unique: true
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role_type", default: 0, null: false
    t.string "fb_uid"
    t.string "youtube_uid"
    t.string "instagram_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_type", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings_destinations", "bookings"
  add_foreign_key "bookings_destinations", "destinations"
  add_foreign_key "destinations", "tours"
  add_foreign_key "destinations_packages", "destinations"
  add_foreign_key "destinations_packages", "packages"
  add_foreign_key "products", "categories"
  add_foreign_key "profiles", "users"
  add_foreign_key "service_requests", "users"
  add_foreign_key "tours", "users"
end
