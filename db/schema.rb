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

ActiveRecord::Schema.define(version: 20170410145100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_options", force: :cascade do |t|
    t.integer "question_id"
    t.integer "question_group_id"
    t.string  "text",              null: false
    t.integer "order"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id",        null: false
    t.integer "survey_response_id", null: false
    t.text    "response",           null: false
  end

  create_table "journal_entries", force: :cascade do |t|
    t.text    "content",   null: false
    t.integer "author_id", null: false
    t.date    "date_for",  null: false
  end

  create_table "question_groups", force: :cascade do |t|
    t.string  "title"
    t.text    "description", null: false
    t.integer "survey_id",   null: false
    t.integer "order"
  end

  create_table "question_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "survey_id",                        null: false
    t.text    "text",                             null: false
    t.integer "question_type_id",                 null: false
    t.boolean "mandatory",         default: true, null: false
    t.integer "question_group_id"
    t.integer "order"
  end

  create_table "resource_topics", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "topic_id"
    t.index ["resource_id"], name: "index_resource_topics_on_resource_id", using: :btree
    t.index ["topic_id"], name: "index_resource_topics_on_topic_id", using: :btree
  end

  create_table "resource_types", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "type_id"
    t.index ["resource_id"], name: "index_resource_types_on_resource_id", using: :btree
    t.index ["type_id"], name: "index_resource_types_on_type_id", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title",             null: false
    t.text     "description"
    t.string   "physical_location"
    t.string   "url"
    t.integer  "author_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer "respondent_id", null: false
    t.integer "survey_id",     null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string  "name",                       null: false
    t.string  "description",                null: false
    t.integer "author_id",                  null: false
    t.boolean "active",      default: true, null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "icon"
    t.string   "hover_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
