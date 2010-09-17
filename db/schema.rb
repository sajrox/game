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

ActiveRecord::Schema.define(:version => 20100915214011) do

  create_table "fighters", :force => true do |t|
    t.integer "member_id"
    t.string  "name",      :limit => 40, :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "email",         :limit => 100,                                    :null => false
    t.string   "login",         :limit => 40,                                     :null => false
    t.string   "hpassword",     :limit => 40,                                     :null => false
    t.string   "salt",          :limit => 6,                                      :null => false
    t.datetime "date_register",                :default => '2010-09-16 22:48:57', :null => false
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

end
