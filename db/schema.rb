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

ActiveRecord::Schema.define(version: 2021_11_29_034608) do

  create_table "adminmessages", force: :cascade do |t|
    t.string "message"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_adminmessages_on_staff_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "voter_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["voter_id", "post_id"], name: "index_likes_on_voter_id_and_post_id", unique: true
    t.index ["voter_id"], name: "index_likes_on_voter_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "first_phrase"
    t.string "second_phrase"
    t.string "third_phrase"
    t.string "pen_name"
    t.string "category"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "like_post", default: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "login_id", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_name"
    t.string "category_name"
    t.index ["login_id"], name: "index_staffs_on_login_id", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "gender"
    t.string "address"
    t.string "profession"
    t.string "age"
    t.string "note"
    t.string "questionary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other"
  end

  create_table "voterposts", force: :cascade do |t|
    t.integer "favorite_post1"
    t.string "reason1"
    t.integer "favorite_post2"
    t.string "reason2"
    t.integer "favorite_post3"
    t.string "reason3"
    t.integer "favorite_post4"
    t.string "reason4"
    t.integer "favorite_post5"
    t.string "reason5"
    t.integer "favorite_post6"
    t.string "reason6"
    t.integer "favorite_post7"
    t.string "reason7"
    t.integer "favorite_post8"
    t.string "reason8"
    t.integer "favorite_post9"
    t.string "reason9"
    t.integer "favorite_post10"
    t.string "reason10"
    t.integer "favorite_post11"
    t.string "reason11"
    t.integer "voter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voter_id"], name: "index_voterposts_on_voter_id"
  end

  create_table "voters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "group"
    t.string "favorite_post"
    t.string "reason"
    t.boolean "admin", default: false
    t.index ["name"], name: "index_voters_on_name", unique: true
    t.index ["reset_password_token"], name: "index_voters_on_reset_password_token", unique: true
  end

end
