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

ActiveRecord::Schema.define(version: 20140923211841) do

  create_table "cars", force: true do |t|
    t.integer  "user_id",        precision: 38, scale: 0
    t.string   "vin"
    t.string   "license_state"
    t.string   "license_number"
    t.string   "distance_unit"
    t.string   "fuel_unit"
    t.string   "location_id"
    t.string   "model_year"
    t.string   "model_make"
    t.string   "model"
    t.string   "model_trim"
    t.string   "vehicle_type"
    t.string   "engine"
    t.string   "drive_type"
    t.string   "body_style"
    t.string   "doors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "select_options", force: true do |t|
    t.string   "domain",                                   null: false
    t.string   "code_value",                               null: false
    t.string   "display_value",                            null: false
    t.integer  "display_order",   precision: 38, scale: 0
    t.decimal  "value_as_number", precision: 11, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.string   "display_name_lower",                              default: "", null: false
    t.datetime "birthday"
    t.integer  "location_id",            precision: 38, scale: 0
    t.string   "email",                                           default: "", null: false
    t.string   "encrypted_password",                              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          precision: 38, scale: 0, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        precision: 38, scale: 0, default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["display_name_lower"], name: "i_users_display_name_lower", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

end
