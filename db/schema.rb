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

ActiveRecord::Schema.define(version: 20170526000651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.jsonb    "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb    "score"
    t.index ["test_id"], name: "index_answers_on_test_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "level_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["level_id"], name: "index_courses_on_level_id", using: :btree
    t.index ["name", "level_id"], name: "index_courses_on_name_and_level_id", using: :btree
  end

  create_table "courses_groups", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_groups_on_course_id", using: :btree
    t.index ["group_id"], name: "index_courses_groups_on_group_id", using: :btree
  end

  create_table "courses_tests", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_users", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "excercises", id: :integer, default: -> { "nextval('excercises_id_seq'::regclass)" }, force: :cascade do |t|
    t.string   "code",          limit: 16
    t.string   "excercise_type"
    t.integer  "status",        limit: 2
    t.string   "name"
    t.string   "command"
    t.jsonb    "data",                     default: "{}", null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "test_id"
    t.jsonb    "answers"
    t.integer  "point_factor",             default: 1
    t.index ["code", "status", "name", "test_id"], name: "index_excercises_on_code_and_status_and_name_and_test_id", using: :btree
  end

  create_table "excercises_storage_files", id: :integer, default: -> { "nextval('excercises_storage_files_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer  "storage_file_id"
    t.integer  "excercise_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "groups_teachers", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_teachers_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_teachers_on_user_id", using: :btree
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_users_on_user_id", using: :btree
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_files", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "item_file_name"
    t.string   "item_content_type"
    t.integer  "item_file_size"
    t.datetime "item_updated_at"
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "level_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["level_id"], name: "index_tests_on_level_id", using: :btree
    t.index ["name", "level_id"], name: "index_tests_on_name_and_level_id", using: :btree
  end

  create_table "user_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_code"
    t.jsonb    "meta"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_user_logs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.integer  "status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "overall_score",   default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "answers", "tests"
  add_foreign_key "answers", "users"
  add_foreign_key "courses", "levels"
  add_foreign_key "courses_groups", "courses"
  add_foreign_key "courses_groups", "groups"
  add_foreign_key "groups_teachers", "groups"
  add_foreign_key "groups_teachers", "users"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "tests", "levels"
  add_foreign_key "user_logs", "users"
end
