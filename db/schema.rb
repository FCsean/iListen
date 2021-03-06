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

ActiveRecord::Schema.define(version: 20150303123355) do

  create_table "playlists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "song_id",     limit: 4
    t.integer "playlist_id", limit: 4
  end

  add_index "playlists_songs", ["playlist_id", "song_id"], name: "index_playlists_songs_on_playlist_id_and_song_id", using: :btree
  add_index "playlists_songs", ["playlist_id"], name: "index_playlists_songs_on_playlist_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "artist",            limit: 255
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "song_file_name",    limit: 255
    t.string   "song_content_type", limit: 255
    t.integer  "song_file_size",    limit: 4
    t.datetime "song_updated_at"
  end

  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "username",      limit: 255
    t.string   "password_hash", limit: 255
    t.string   "salt",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "playlists", "users"
  add_foreign_key "songs", "users"
end
