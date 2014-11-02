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

ActiveRecord::Schema.define(version: 20141102075851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_slas", force: true do |t|
    t.integer  "quantity"
    t.string   "period"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_units", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_slas", force: true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "business_unit_id"
    t.string   "job_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.integer  "wfm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_slas", force: true do |t|
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "finished_datetime"
    t.string   "current_state"
    t.integer  "client_sla_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "job_no"
    t.string   "job_type"
    t.string   "job_state"
    t.datetime "start_date"
    t.datetime "due_date"
    t.string   "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lookups", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "lookup_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "user_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "prowl"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wfm_calls", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
