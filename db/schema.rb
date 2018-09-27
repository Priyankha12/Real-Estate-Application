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

ActiveRecord::Schema.define(version: 2018_09_27_144506) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.string "location"
    t.integer "square_footage"
    t.date "year"
    t.string "style"
    t.float "price"
    t.integer "floors"
    t.boolean "basement"
    t.string "current_owner"
    t.string "hunter_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "realtors_id"
    t.integer "real_estate_company_id"
    t.integer "realtor_id"
  end

  create_table "hunters", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "full_name"
    t.string "phone"
    t.string "contact_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "house_id"
    t.integer "hunter_id"
  end

  create_table "real_estate_companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.integer "size"
    t.date "founded"
    t.float "revenue"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realtors", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "real_estate_company_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_realtors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_realtors_on_reset_password_token", unique: true
  end

end
