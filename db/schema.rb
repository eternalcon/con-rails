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

ActiveRecord::Schema.define(version: 20180401121735) do

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "event_registrations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_status", default: "open"
    t.string "registration_token"
    t.index ["event_id"], name: "index_event_registrations_on_event_id"
    t.index ["registration_token"], name: "index_event_registrations_on_registration_token", unique: true
    t.index ["user_id"], name: "index_event_registrations_on_user_id"
  end

  create_table "event_registrations_participants", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "event_registration_id", null: false
    t.bigint "participant_id", null: false
    t.index ["event_registration_id"], name: "fk_rails_dd30c791e8"
    t.index ["participant_id"], name: "fk_rails_ac58f31357"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "max_participants"
    t.decimal "full_price", precision: 10
    t.decimal "youth", precision: 10
    t.decimal "child", precision: 10
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ff_registrations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "freeform_id"
    t.bigint "user_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freeform_id"], name: "index_ff_registrations_on_freeform_id"
    t.index ["user_id"], name: "index_ff_registrations_on_user_id"
  end

  create_table "ff_registrations_participants", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "ff_registration_id"
    t.bigint "participant_id"
    t.index ["ff_registration_id"], name: "index_ff_registrations_participants_on_ff_registration_id"
    t.index ["participant_id"], name: "index_ff_registrations_participants_on_participant_id"
  end

  create_table "freeforms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description_de"
    t.text "description_en"
    t.string "language"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "min_participants"
    t.integer "max_participants"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author_email"
    t.index ["event_id"], name: "index_freeforms_on_event_id"
  end

  create_table "participants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "country"
    t.string "postcode"
    t.date "birthdate"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name", "birthdate"], name: "index_participants_on_first_name_and_last_name_and_birthdate", unique: true
    t.index ["user_id"], name: "index_participants_on_user_id", unique: true
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_registrations", "events"
  add_foreign_key "event_registrations", "users"
  add_foreign_key "event_registrations_participants", "event_registrations"
  add_foreign_key "event_registrations_participants", "participants"
  add_foreign_key "ff_registrations", "freeforms"
  add_foreign_key "ff_registrations", "users"
  add_foreign_key "ff_registrations_participants", "ff_registrations"
  add_foreign_key "ff_registrations_participants", "participants"
  add_foreign_key "freeforms", "events"
  add_foreign_key "participants", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
end
