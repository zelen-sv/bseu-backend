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

ActiveRecord::Schema.define(version: 2018_11_07_075252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.integer "gender", default: 1
    t.string "nationality"
    t.string "passport_id"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birthday"
    t.string "passport_starts_at"
    t.string "passport_ends_at"
    t.string "passport_authority"
    t.string "education_type"
    t.string "education_form"
    t.boolean "hostel", default: true
    t.string "arrival_date"
  end

  create_table "faculties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculty_translations", force: :cascade do |t|
    t.integer "faculty_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.index ["faculty_id"], name: "index_faculty_translations_on_faculty_id"
    t.index ["locale"], name: "index_faculty_translations_on_locale"
  end

# Could not dump table "specialties" because of following StandardError
#   Unknown type 'education_program' for column 'education_program'

  create_table "specialty_translations", force: :cascade do |t|
    t.integer "specialty_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.string "qualification", default: [], array: true
    t.index ["locale"], name: "index_specialty_translations_on_locale"
    t.index ["specialty_id"], name: "index_specialty_translations_on_specialty_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "specialties", "faculties"
end
