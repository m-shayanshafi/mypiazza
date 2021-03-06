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

ActiveRecord::Schema.define(version: 20160307195333) do

  create_table "courses", force: :cascade do |t|
    t.string   "cnum"
    t.string   "title"
    t.string   "term"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cthreads", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title"
    t.datetime "posted_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cthreads", ["course_id"], name: "index_cthreads_on_course_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "cthread_id"
    t.string   "heading"
    t.string   "statement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "questions", ["cthread_id"], name: "index_questions_on_cthread_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "answer"
    t.string   "posted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "responses", ["question_id"], name: "index_responses_on_question_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
