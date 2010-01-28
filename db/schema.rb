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

ActiveRecord::Schema.define(:version => 20100128085246) do

  create_table "products", :force => true do |t|
    t.integer  "statistic_id"
    t.string   "name"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "item_rule"
    t.string   "product_name_rule"
    t.string   "price_rule"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", :force => true do |t|
    t.integer  "rule_id"
    t.string   "keyword"
    t.float    "download_time"
    t.float    "extract_time"
    t.float    "memory_consumption"
    t.float    "file_size_before_extraction"
    t.float    "file_size_after_extraction"
    t.integer  "number_of_product_should_be_extracted"
    t.integer  "number_of_product_extracted"
    t.integer  "number_of_true_product_extracted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
