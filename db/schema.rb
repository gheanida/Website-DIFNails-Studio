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

ActiveRecord::Schema[8.1].define(version: 2026_07_18_101622) do
  create_table "admin_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bookings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "booking_date"
    t.time "booking_time"
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.text "notes"
    t.bigint "service_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "name"
    t.string "phone"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "service_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "services", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "duration_minutes"
    t.string "image_url"
    t.boolean "is_active"
    t.string "name"
    t.decimal "price", precision: 10
    t.bigint "service_category_id", null: false
    t.datetime "updated_at", null: false
    t.index ["service_category_id"], name: "index_services_on_service_category_id"
  end

  create_table "transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "amount", precision: 10
    t.bigint "booking_id", null: false
    t.string "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.date "transaction_date"
    t.string "transaction_type"
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_transactions_on_booking_id"
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "services"
  add_foreign_key "services", "service_categories"
  add_foreign_key "transactions", "bookings"
end
