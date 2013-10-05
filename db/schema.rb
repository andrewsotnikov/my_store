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

ActiveRecord::Schema.define(version: 20131005151512) do

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "items", force: true do |t|
    t.float    "price"
    t.string   "name"
    t.boolean  "real"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "votes_count", default: 0
  end

  add_index "items", ["name"], name: "index_items_on_name"
  add_index "items", ["price"], name: "index_items_on_price"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "positions", force: true do |t|
    t.integer  "item_id"
    t.integer  "quantity",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "positionable_id"
    t.string   "positionable_type"
  end

  add_index "positions", ["item_id"], name: "index_positions_on_item_id"
  add_index "positions", ["positionable_id", "positionable_type"], name: "index_positions_on_positionable_id_and_positionable_type"

  create_table "users", force: true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
