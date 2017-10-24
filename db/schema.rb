# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171023213922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buyers", ["shoe_id"], name: "index_buyers_on_shoe_id", using: :btree
  add_index "buyers", ["user_id"], name: "index_buyers_on_user_id", using: :btree

  create_table "sellers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sellers", ["shoe_id"], name: "index_sellers_on_shoe_id", using: :btree
  add_index "sellers", ["user_id"], name: "index_sellers_on_user_id", using: :btree

  create_table "shoes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shoes", ["user_id"], name: "index_shoes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "buyers", "shoes"
  add_foreign_key "buyers", "users"
  add_foreign_key "sellers", "shoes"
  add_foreign_key "sellers", "users"
  add_foreign_key "shoes", "users"
end
