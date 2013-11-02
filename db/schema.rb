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

ActiveRecord::Schema.define(:version => 20130713180649) do

  create_table "empires", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "clan"
    t.integer  "treasury"
    t.integer  "armies_count", :default => 0
    t.integer  "cities_count", :default => 0
    t.integer  "agents_count", :default => 0
    t.string   "war_with"
    t.string   "peace_with"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "user_id"
    t.integer  "difficulty"
    t.integer  "status",     :default => 10
    t.integer  "turn"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "pieces", :force => true do |t|
    t.integer  "pieceType"
    t.string   "name"
    t.string   "square"
    t.integer  "empire_id"
    t.integer  "built_id"
    t.text     "buildings"
    t.integer  "population"
    t.text     "building_queue"
    t.text     "units_queue"
    t.text     "general"
    t.integer  "moves"
    t.text     "units"
    t.text     "agents"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "stages", :force => true do |t|
    t.integer  "game_id"
    t.text     "section_0"
    t.text     "section_1"
    t.text     "section_2"
    t.text     "section_3"
    t.text     "section_4"
    t.text     "section_5"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "completed"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
