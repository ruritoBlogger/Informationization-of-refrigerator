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

ActiveRecord::Schema.define(version: 2018_09_05_062613) do

  create_table "foods", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "limittype"
    t.integer "limitYear"
    t.integer "limitMonth"
    t.integer "limitDay"
    t.integer "foodtype"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.integer "amounttype"
    t.integer "yetamount"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name"
    t.text "introduction"
    t.integer "level"
    t.integer "exp"
  end

end
