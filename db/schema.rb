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

ActiveRecord::Schema.define(version: 20150625042301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "post_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.string   "instructor"
    t.text     "quotes"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "cl_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "quote"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "last_active"
    t.boolean  "alumni"
    t.boolean  "admin"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password_digest"
    t.integer  "group_id"
    t.string   "tagline"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "github_username"
    t.string   "twitter_username"
    t.string   "slack_username"
    t.string   "linkedin_profile"
  end

end
