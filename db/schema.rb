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

ActiveRecord::Schema.define(version: 20171205105833) do

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "genre_id"
    t.bigint "artist_id"
    t.string "cover_image"
    t.date "release_date"
    t.index ["artist_id"], name: "fk_rails_124a79559a"
    t.index ["genre_id"], name: "fk_rails_78dbff46af"
  end

  create_table "artists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.text "avatar_url"
    t.string "country"
    t.date "formed_in"
    t.boolean "is_touring", default: false
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "likes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "fk_rails_d67ef1eb45"
  end

  create_table "playlists_songs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "playlist_id", null: false
    t.bigint "song_id", null: false
    t.index ["playlist_id"], name: "index_playlists_songs_on_playlist_id"
    t.index ["song_id"], name: "index_playlists_songs_on_song_id"
  end

  create_table "songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id"
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["artist_id"], name: "fk_rails_5ce8fd4cc7"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "genres"
  add_foreign_key "playlists", "users"
  add_foreign_key "playlists_songs", "playlists"
  add_foreign_key "playlists_songs", "songs"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "artists"
end
