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

ActiveRecord::Schema.define(:version => 20110617233750) do

  create_table "bills", :force => true do |t|
    t.integer  "order_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filiales", :force => true do |t|
    t.string   "name"
    t.string   "adress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_bills", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "bill_id"
    t.integer  "quantity"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "cart_id"
    t.integer  "quantity",     :default => 0
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "reference_id"
    t.integer  "quantity"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_receptions", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "reception_id"
    t.integer  "line_order_id"
    t.integer  "received_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.string   "state",         :default => "en attente de validation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "filiale_id"
  end

  create_table "receptions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price",              :default => 0
    t.string   "status",             :default => "en attente de validation"
    t.integer  "country_id"
    t.integer  "category_id"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
  end

  create_table "stocks", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "filiale_id"
    t.integer  "quantity",     :default => 0
    t.integer  "min_alert",    :default => 0
    t.boolean  "direct_order", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",       :default => "en attente"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "adress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                                  :default => "user"
    t.integer  "filiale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
