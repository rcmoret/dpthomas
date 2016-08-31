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

ActiveRecord::Schema.define(version: 20160831032438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.text     "announcement"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "priority"
  end

  create_table "discussions", force: :cascade do |t|
    t.string   "topic",      limit: 255
    t.text     "content"
    t.integer  "member_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "email_listings", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.date     "date"
    t.text     "event_details"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "location",         limit: 255
    t.text     "details"
    t.boolean  "has_registration"
    t.integer  "adult_fee"
    t.integer  "child_fee"
    t.string   "name",             limit: 255
    t.boolean  "show_past_event",              default: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.text     "biography"
    t.string   "image",                  limit: 255
    t.string   "email",                  limit: 255, default: "",   null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "phone",                  limit: 255
    t.string   "position",               limit: 255
    t.integer  "rank"
    t.boolean  "public_email",                       default: true
    t.string   "image_name",             limit: 255
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "email",           limit: 255
    t.integer  "adults"
    t.integer  "children"
    t.string   "additional_info", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "fee"
  end

  create_table "replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "discussion_id"
    t.integer  "member_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "details"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
