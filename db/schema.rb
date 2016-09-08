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

ActiveRecord::Schema.define(version: 20160908095438) do

  create_table "url_visits", force: :cascade do |t|
    t.integer  "url_id",               limit: 4
    t.string   "visitor_ip",           limit: 255
    t.string   "visitor_city",         limit: 255
    t.string   "visitor_state",        limit: 255
    t.string   "visitor_country_iso2", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "urls", force: :cascade do |t|
    t.text     "original_url", limit: 65535
    t.string   "shorty",       limit: 255
    t.integer  "user_id",      limit: 4
    t.integer  "visits_count", limit: 4,     default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "urls", ["shorty"], name: "index_urls_on_shorty", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255
    t.string   "encrypted_password", limit: 255
    t.string   "api_token",          limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "users", ["api_token"], name: "index_users_on_api_token", using: :btree

end
