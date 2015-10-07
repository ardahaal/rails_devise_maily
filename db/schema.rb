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

ActiveRecord::Schema.define(version: 20151001110524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maily_herald_dispatches", force: :cascade do |t|
    t.string   "type",                                       null: false
    t.integer  "sequence_id"
    t.integer  "list_id",                                    null: false
    t.text     "conditions"
    t.text     "start_at"
    t.string   "mailer_name"
    t.string   "name",                                       null: false
    t.string   "title"
    t.string   "subject"
    t.string   "from"
    t.string   "state",                 default: "disabled"
    t.text     "template"
    t.integer  "absolute_delay"
    t.integer  "period"
    t.boolean  "override_subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maily_herald_dispatches", ["name"], name: "index_maily_herald_dispatches_on_name", unique: true, using: :btree

  create_table "maily_herald_lists", force: :cascade do |t|
    t.string "name",         null: false
    t.string "title"
    t.string "context_name"
  end

  create_table "maily_herald_logs", force: :cascade do |t|
    t.integer  "entity_id",     null: false
    t.string   "entity_type",   null: false
    t.string   "entity_email"
    t.integer  "mailing_id"
    t.string   "status",        null: false
    t.text     "data"
    t.datetime "processing_at"
  end

  create_table "maily_herald_subscriptions", force: :cascade do |t|
    t.integer  "entity_id",                    null: false
    t.integer  "list_id",                      null: false
    t.string   "entity_type",                  null: false
    t.string   "token",                        null: false
    t.text     "settings"
    t.text     "data"
    t.boolean  "active",       default: false, null: false
    t.datetime "delivered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
