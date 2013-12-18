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
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20131218232347) do


  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_products", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "status",        default: "pending"
    t.string   "shipping_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchase_id"
    t.string   "session_id"
    t.integer  "user_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.boolean  "retired",     default: false
    t.string   "image"
    t.integer  "stock"
    t.integer  "user_id"
  end

  create_table "purchases", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zip"
    t.string   "billing_first"
    t.string   "billing_last"
    t.string   "credit_card_number"
    t.integer  "cvv"
    t.string   "billing_zip"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "billing_state"
    t.boolean  "same_address"
    t.integer  "order_id"
    t.integer  "expiration_date"
  end

  create_table "reviews", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.text     "review_text"
    t.integer  "product_id"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
