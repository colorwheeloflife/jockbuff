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

ActiveRecord::Schema.define(version: 20161030021444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goalie_categories", force: :cascade do |t|
    t.integer  "league_id"
    t.boolean  "gs"
    t.boolean  "w"
    t.boolean  "l"
    t.boolean  "ga"
    t.boolean  "gaa"
    t.boolean  "sa"
    t.boolean  "sec"
    t.boolean  "sv"
    t.boolean  "svpercent"
    t.boolean  "sho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_goalie_categories_on_league_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "sport"
    t.string   "user_team"
    t.string   "user_logo"
    t.string   "league_name"
    t.string   "league_key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_leagues_on_user_id", using: :btree
  end

  create_table "player_categories", force: :cascade do |t|
    t.integer  "league_id"
    t.boolean  "g"
    t.boolean  "a"
    t.boolean  "p"
    t.boolean  "plusminus"
    t.boolean  "pim"
    t.boolean  "ppg"
    t.boolean  "ppa"
    t.boolean  "ppp"
    t.boolean  "shg"
    t.boolean  "sha"
    t.boolean  "shp"
    t.boolean  "gwg"
    t.boolean  "gtg"
    t.boolean  "sog"
    t.boolean  "shpercent"
    t.boolean  "fw"
    t.boolean  "fl"
    t.boolean  "hit"
    t.boolean  "blk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_player_categories_on_league_id", using: :btree
  end

  create_table "player_passports", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "position"
    t.integer  "draft_position"
    t.integer  "yahoo_rank"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "team_id"
    t.integer  "league_id"
    t.index ["league_id"], name: "index_player_passports_on_league_id", using: :btree
    t.index ["player_id"], name: "index_player_passports_on_player_id", using: :btree
    t.index ["team_id"], name: "index_player_passports_on_team_id", using: :btree
  end

  create_table "player_predictions", id: false, force: :cascade do |t|
    t.integer  "gp"
    t.integer  "g"
    t.integer  "a"
    t.integer  "p"
    t.integer  "plusminus"
    t.integer  "pim"
    t.integer  "ppg"
    t.integer  "ppp"
    t.integer  "ppa"
    t.integer  "shg"
    t.integer  "sha"
    t.integer  "shp"
    t.integer  "gwg"
    t.integer  "gtg"
    t.integer  "sog"
    t.float    "shpercent"
    t.integer  "fw"
    t.integer  "fl"
    t.integer  "hit"
    t.integer  "blk"
    t.float    "total"
    t.integer  "gs"
    t.integer  "w"
    t.integer  "l"
    t.integer  "ga"
    t.float    "gaa"
    t.integer  "sa"
    t.integer  "sv"
    t.integer  "sec"
    t.float    "svpercent"
    t.integer  "sho"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_stats", id: false, force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "gp"
    t.integer  "g"
    t.integer  "a"
    t.integer  "p"
    t.integer  "plusminus"
    t.integer  "pim"
    t.integer  "ppg"
    t.integer  "ppp"
    t.integer  "ppa"
    t.integer  "shg"
    t.integer  "sha"
    t.integer  "shp"
    t.integer  "gwg"
    t.integer  "gtg"
    t.integer  "sog"
    t.float    "shpercent"
    t.integer  "fw"
    t.integer  "fl"
    t.integer  "hit"
    t.integer  "blk"
    t.integer  "gs"
    t.integer  "w"
    t.integer  "l"
    t.integer  "ga"
    t.float    "gaa"
    t.integer  "sa"
    t.integer  "sv"
    t.integer  "sec"
    t.float    "svpercent"
    t.integer  "sho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", id: false, force: :cascade do |t|
    t.integer  "player_id",  null: false
    t.string   "name"
    t.string   "positions",               array: true
    t.string   "pro_team"
    t.string   "type_p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_players_on_player_id", unique: true, using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "league_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "ownership"
    t.string   "name"
    t.string   "image"
    t.string   "nickname"
    t.string   "url"
    t.index ["league_id"], name: "index_teams_on_league_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
