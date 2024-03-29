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

ActiveRecord::Schema.define(:version => 20120613175308) do

  create_table "auths", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.integer  "avatar_uid"
    t.string   "avatar_name"
    t.string   "path"
    t.string   "avatar"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "price_id"
  end

  create_table "prices", :force => true do |t|
    t.string   "name_en"
    t.string   "description_en"
    t.float    "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "category_id"
    t.string   "name_ru"
    t.string   "description_ru"
  end

end
