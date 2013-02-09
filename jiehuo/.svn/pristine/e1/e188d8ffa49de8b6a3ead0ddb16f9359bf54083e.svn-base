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

ActiveRecord::Schema.define(:version => 20120618075103) do

  create_table "answers", :primary_key => "answer_id", :force => true do |t|
    t.text     "result"
    t.text     "comment"
    t.string   "modifier"
    t.integer  "user_id"
    t.integer  "ask_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :primary_key => "area_id", :force => true do |t|
    t.string   "name"
    t.string   "creator"
    t.string   "modifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asks", :primary_key => "ask_id", :force => true do |t|
    t.text     "body"
    t.text     "body_item"
    t.string   "ask_type"
    t.text     "result"
    t.text     "comment"
    t.string   "modifier"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "asks_sections", :id => false, :force => true do |t|
    t.integer "ask_id",     :null => false
    t.integer "section_id", :null => false
  end

  add_index "asks_sections", ["ask_id"], :name => "index_asks_sections_on_ask_id"
  add_index "asks_sections", ["section_id"], :name => "index_asks_sections_on_section_id"

  create_table "cities", :force => true do |t|
    t.string   "cityid"
    t.string   "city"
    t.string   "fatherid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :primary_key => "comment_id", :force => true do |t|
    t.text     "body"
    t.string   "modifier"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", :primary_key => "domain_id", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "creator"
    t.string   "modifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.integer  "last_send_attempt", :default => 0
    t.text     "mail"
    t.datetime "created_on"
  end

  create_table "favorite_asks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ask_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followed_projects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followers", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "be_follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interest_users", :force => true do |t|
    t.integer  "cur_user_id"
    t.integer  "int_user_id"
    t.integer  "score"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
  end

  create_table "interest_users_buffs", :force => true do |t|
    t.integer  "cur_user_id"
    t.integer  "int_user_id"
    t.integer  "score"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
  end

  create_table "projects", :primary_key => "project_id", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "creator"
    t.string   "modifier"
    t.integer  "domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", :force => true do |t|
    t.string   "provinceid"
    t.string   "province"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :primary_key => "school_id", :force => true do |t|
    t.string   "name"
    t.string   "creator"
    t.string   "modifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provinceid"
  end

  create_table "sections", :primary_key => "section_id", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "creator"
    t.string   "modifier"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "encrypted_password"
    t.text     "introduce"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "provinceid"
    t.string   "cityid"
    t.string   "sex"
    t.date     "birthday"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar",                               :default => "da9133bf0c9a216aec57fb2dcf394017a04e8f62.jpg"
  end

  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"

end
