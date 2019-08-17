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

ActiveRecord::Schema.define(version: 20190817182319) do

  create_table "accounts", force: :cascade do |t|
    t.string   "gender"
    t.integer  "age"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_to_do_items", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "to_do_item_id"
  end

  add_index "tags_to_do_items", ["tag_id"], name: "index_tags_to_do_items_on_tag_id"
  add_index "tags_to_do_items", ["to_do_item_id"], name: "index_tags_to_do_items_on_to_do_item_id"

  create_table "to_do_items", force: :cascade do |t|
    t.string   "task_title"
    t.string   "description"
    t.date     "due_date"
    t.integer  "to_do_list_id"
    t.boolean  "done",          default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "to_do_items", ["to_do_list_id"], name: "index_to_do_items_on_to_do_list_id"

  create_table "to_do_lists", force: :cascade do |t|
    t.string   "list_name"
    t.date     "list_due_date"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "list_color"
  end

  add_index "to_do_lists", ["user_id"], name: "index_to_do_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
