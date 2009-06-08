# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090604133813) do

  create_table "admins", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computer_skill_categories", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computer_skills", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.boolean  "enabled"
    t.integer  "computer_skill_categories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.boolean  "gcc"
    t.boolean  "arab"
    t.boolean  "english_speaking"
    t.boolean  "asian"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "member_id"
    t.string   "name",       :limit => 30,                         :null => false
    t.string   "email"
    t.string   "address"
    t.string   "login_name"
    t.string   "password"
    t.string   "fax"
    t.string   "country"
    t.string   "state"
    t.integer  "phone"
    t.boolean  "enabled",                        :default => true
    t.binary   "photo",      :limit => 16777215
    t.binary   "thumbnail",  :limit => 16777215
    t.date     "dob",                                              :null => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "docs",       :limit => 16777215
  end

  create_table "new_implementations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overviews", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "sequence"
    t.string   "url"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_qualifications", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.integer  "parent_id"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "religions", :force => true do |t|
    t.string   "name"
    t.boolean  "enable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_generators", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
    t.string   "role"
  end

end
