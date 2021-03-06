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

ActiveRecord::Schema.define(:version => 20131227163633) do

  create_table "change_orders", :force => true do |t|
    t.decimal  "hours",      :precision => 5, :scale => 2
    t.datetime "date"
    t.datetime "end_date"
    t.integer  "project_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "change_orders", ["project_id"], :name => "index_change_orders_on_project_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "skype_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "clients", ["contact_name"], :name => "index_clients_on_contact_name"
  add_index "clients", ["name"], :name => "index_clients_on_name"

  create_table "holy_day_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "holy_days", :force => true do |t|
    t.date     "day"
    t.integer  "holy_day_list_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "holy_days", ["holy_day_list_id"], :name => "index_holy_days_on_holy_day_list_id"

  create_table "hours", :force => true do |t|
    t.decimal  "total_hours",       :precision => 5, :scale => 2
    t.text     "tasks_description"
    t.datetime "date"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "invoicing_types", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  add_index "invoicing_types", ["name"], :name => "index_invoicing_types_on_name"

  create_table "projects", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.decimal  "total_hours",       :precision => 5, :scale => 2, :default => 0.0
    t.integer  "client_id"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "invoicing_type_id"
    t.string   "colour"
  end

  add_index "projects", ["client_id"], :name => "index_projects_on_client_id"
  add_index "projects", ["invoicing_type_id"], :name => "index_projects_on_invoicing_type_id"
  add_index "projects", ["name"], :name => "index_projects_on_name"

  create_table "user_projects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_projects", ["project_id"], :name => "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id"], :name => "index_user_projects_on_user_id"

  create_table "user_types", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  add_index "user_types", ["name"], :name => "index_user_types_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                                :default => "", :null => false
    t.string   "encrypted_password",                                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "skype_id"
    t.string   "phone"
    t.string   "mobile"
    t.decimal  "rate",                   :precision => 8, :scale => 2
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.integer  "user_type_id"
    t.integer  "holy_day_list_id"
    t.integer  "default_project"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["holy_day_list_id"], :name => "index_users_on_holy_day_list_id"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["user_type_id"], :name => "index_users_on_user_type_id"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
