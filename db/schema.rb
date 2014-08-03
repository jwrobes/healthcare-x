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

ActiveRecord::Schema.define(version: 20140802223952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_sets", force: true do |t|
    t.integer  "age"
    t.string   "scope"
    t.boolean  "smoker"
    t.integer  "user_id"
    t.float    "risk_tolerance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_sets", ["user_id"], name: "index_answer_sets_on_user_id", using: :btree

  create_table "health_plans", force: true do |t|
    t.string   "state"
    t.string   "issuer_name"
    t.string   "plan_marketing_name"
    t.string   "plan_type"
    t.string   "rating_area"
    t.float    "premium_adult_individual_age_27"
    t.float    "premium_adult_individual_age_50"
    t.float    "premium_family_age_30"
    t.float    "medical_deductable_individual_in_network"
    t.float    "drug_deductable_individual_in_network"
    t.float    "medical_deductable_individual_out_of_network"
    t.float    "drug_deductable_individual_out_of_network"
    t.float    "medical_detectable_family_in_network"
    t.float    "drug_detectable_family_in_network"
    t.float    "medical_deductable_family_out_of_network"
    t.float    "drug_deductable_family_out_of_network"
    t.float    "medical_maximum_out_of_pocket_individual_in_network"
    t.float    "drug_maximum_out_of_pocket_individual_in_network"
    t.float    "medical_maximum_out_of_pocket_individual_out_of_network"
    t.float    "drug_maximum_out_of_pocket_individual_out_of_network"
    t.float    "medical_maximum_out_of_pocket_family_in_network"
    t.float    "drug_maximum_out_of_pocket_family_in_network"
    t.float    "medical_maximum_out_of_pocket_family_out_of_network"
    t.float    "drug_maximum_out_of_pocket_family_out_of_network"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_plans", force: true do |t|
    t.string   "plan_type"
    t.integer  "premium_deductable"
    t.integer  "max_out_of_pocket"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
