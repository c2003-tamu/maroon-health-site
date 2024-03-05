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

ActiveRecord::Schema[7.0].define(version: 2024_02_29_004954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "calendar_events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.integer "ideal_volunteers"
    t.integer "ideal_officers"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ideal_m1", default: 0
    t.integer "ideal_m2", default: 0
    t.integer "ideal_m3", default: 0
    t.integer "ideal_m4", default: 0
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_transactions", force: :cascade do |t|
    t.bigint "medication_id", null: false
    t.bigint "member_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_medication_transactions_on_medication_id"
    t.index ["member_id"], name: "index_medication_transactions_on_member_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.integer "stock"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_shifts", force: :cascade do |t|
    t.integer "event_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "unconfirmed_email"
    t.string "avatar_url"
    t.string "provider"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "uid"
    t.string "role"
    t.string "class_year", default: "N/A"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "resources", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "medication_transactions", "medications"
  add_foreign_key "medication_transactions", "members"
end
