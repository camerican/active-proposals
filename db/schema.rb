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

ActiveRecord::Schema.define(version: 20170214212749) do

  create_table "proposal_options", force: :cascade do |t|
    t.integer "proposal_id"
    t.string  "name"
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.string   "status"
    t.datetime "deadline",   default: '2017-02-14 22:13:29'
  end

  create_table "user_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.integer  "option_id"
    t.datetime "created_at",  default: '2017-02-14 22:14:01'
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
  end

end
