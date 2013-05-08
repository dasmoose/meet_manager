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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130509020341) do

  create_table "events", :force => true do |t|
    t.integer  "race_type_id"
    t.integer  "meet_id"
    t.integer  "number"
    t.string   "gender"
    t.string   "age"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "heat_entries", :force => true do |t|
    t.integer  "swimmer_id"
    t.integer  "swimmer_event_time_id"
    t.integer  "heat_id"
    t.integer  "swim_time"
    t.boolean  "dq"
    t.integer  "result_time"
    t.integer  "lane"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "heats", :force => true do |t|
    t.integer  "event_id"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

# Could not dump table "meets" because of following StandardError
#   Unknown type 'refernce' for column 'event'

  create_table "race_types", :force => true do |t|
    t.string   "stroke"
    t.integer  "distance"
    t.boolean  "individual"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "swimmer_event_times", :force => true do |t|
    t.integer "swimmer_id"
    t.integer "event_id"
    t.integer "heat_entry_id"
    t.integer "entry_time"
  end

  create_table "swimmers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "age"
    t.integer  "team_id"
    t.boolean  "checked_in"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "location"
    t.string   "coach_name"
    t.integer  "meet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string "user_name"
    t.string "password_digest"
    t.string "remember_token"
  end

end
