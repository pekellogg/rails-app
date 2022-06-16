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

ActiveRecord::Schema[7.0].define(version: 2022_06_14_202519) do
  create_table "businesses", force: :cascade do |t|
    t.string "ubi"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.integer "state_id"
    t.string "code"
    t.string "code_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "business_ubi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string "number"
    t.string "type_code"
    t.string "code_desc"
    t.string "specialty_code"
    t.string "specialty_code_desc"
    t.string "status_code"
    t.string "ubi"
    t.string "effective"
    t.string "expires"
    t.string "status_desc"
    t.string "status"
    t.integer "contractor_id"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.boolean "status"
    t.text "desc"
    t.integer "contractor_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "name_abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "email"
    t.text "password_digest"
    t.string "image"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
