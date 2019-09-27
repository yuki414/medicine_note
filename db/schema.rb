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

ActiveRecord::Schema.define(version: 20190926143948) do

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicine_histories", force: :cascade do |t|
    t.string "date"
    t.integer "user_id"
    t.integer "pharmacist_id"
    t.integer "medicine_id"
    t.string "dose"
    t.string "adm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicine_id"], name: "index_medicine_histories_on_medicine_id"
    t.index ["pharmacist_id"], name: "index_medicine_histories_on_pharmacist_id"
    t.index ["user_id"], name: "index_medicine_histories_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.string "effect"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pharmacists", force: :cascade do |t|
    t.string "name"
    t.integer "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_pharmacists_on_institution_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sex"
    t.integer "birthday"
    t.float "height"
    t.float "weight"
    t.string "blood"
    t.string "address"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
