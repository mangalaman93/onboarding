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

<<<<<<< Updated upstream
ActiveRecord::Schema.define(:version => 20130519052215) do
=======
ActiveRecord::Schema.define(:version => 20130521082812) do

  create_table "geckos", :force => true do |t|
    t.float    "value"
    t.float    "previous"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end
>>>>>>> Stashed changes

  create_table "groups", :force => true do |t|
    t.integer  "no_users"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "from_id"
    t.string   "to_email"
    t.text     "content"
    t.string   "guid"
    t.datetime "sent_date",    :default => '2013-05-17 04:57:27'
    t.boolean  "is_confirmed", :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "invitations", ["from_id"], :name => "index_invitations_on_from_id"
  add_index "invitations", ["to_email"], :name => "index_invitations_on_to_id"

  create_table "item_templates", :force => true do |t|
    t.string   "type_of"
    t.string   "description"
    t.integer  "duration"
    t.string   "comments"
    t.text     "metadata"
    t.integer  "task_template_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "item_templates", ["task_template_id"], :name => "index_item_templates_on_task_template_id"

  create_table "items", :force => true do |t|
    t.string   "type_of"
    t.string   "description"
    t.integer  "duration"
    t.integer  "user_id"
    t.datetime "due_date"
    t.text     "comments"
    t.text     "metadata"
    t.integer  "task_id"
    t.boolean  "is_done"
    t.boolean  "is_vetoed"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "items", ["task_id"], :name => "index_items_on_task_id"

  create_table "messages", :force => true do |t|
    t.integer  "thread_id"
    t.integer  "sender_id"
    t.integer  "group_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "hr_id"
    t.integer  "bu_id"
    t.integer  "manager_id"
    t.integer  "mentor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plans", ["user_id"], :name => "index_plans_on_user_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "suggestions", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "suggestion_data"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "task_templates", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.integer  "creator_id"
    t.integer  "owner_id"
    t.datetime "invitation_sentdate"
    t.boolean  "owner_confirmed"
    t.integer  "plan_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "tasks", ["plan_id"], :name => "index_tasks_on_plan_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "en_passwd"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "salt"
    t.date     "date_of_birth"
    t.boolean  "is_admin",               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
