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

ActiveRecord::Schema.define(version: 20140121000258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_ratings", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_ratings", ["book_id", "user_id"], name: "index_book_ratings_on_book_id_and_user_id", using: :btree
  add_index "book_ratings", ["rating"], name: "index_book_ratings_on_rating", using: :btree

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.integer  "year_of_publication"
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "location"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
