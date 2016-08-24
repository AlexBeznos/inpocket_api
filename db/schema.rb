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

ActiveRecord::Schema.define(version: 20160824000250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beacons", force: :cascade do |t|
    t.string   "uuid"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_beacons_on_place_id", using: :btree
  end

  create_table "debut_present_relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_debut_present_relations_on_place_id", using: :btree
    t.index ["user_id"], name: "index_debut_present_relations_on_user_id", using: :btree
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "platform"
    t.string   "push_token"
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "stars"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.decimal  "price",            precision: 8, scale: 2
    t.integer  "menu_category_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.boolean  "day_item",                                 default: false
    t.index ["menu_category_id"], name: "index_menu_items_on_menu_category_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.text     "phones"
    t.string   "logo"
    t.string   "lat"
    t.string   "lng"
    t.text     "images"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "color"
    t.string   "site"
    t.text     "working_hours"
    t.boolean  "in_pocket",     default: false
    t.string   "category"
    t.integer  "bonus_part",    default: 10
  end

  create_table "presents", force: :cascade do |t|
    t.string   "image"
    t.string   "price"
    t.text     "description"
    t.string   "name"
    t.integer  "place_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "debut",       default: false
    t.index ["place_id"], name: "index_presents_on_place_id", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.integer  "place_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["place_id"], name: "index_shares_on_place_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "signed",     default: false
    t.string   "photo"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
