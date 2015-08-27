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

ActiveRecord::Schema.define(version: 20150826030458) do

  create_table "readers", force: :cascade do |t|
    t.string   "email",                         null: false
    t.string   "status",     default: "closed"
    t.integer  "choice",     default: 1
    t.integer  "verse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "readers", ["email"], name: "index_readers_on_email", unique: true

  create_table "steps", force: :cascade do |t|
    t.integer "parent_id",             null: false
    t.integer "child_id",              null: false
    t.integer "choice",    default: 1, null: false
  end

  create_table "verses", force: :cascade do |t|
    t.string   "subject"
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
