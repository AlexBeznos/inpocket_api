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

ActiveRecord::Schema.define(version: 20161010080310) do

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
    t.string   "uniq_id"
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "facebook_profiles", force: :cascade do |t|
    t.bigint   "uid"
    t.string   "email"
    t.integer  "gender"
    t.string   "username"
    t.date     "birthday"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_facebook_profiles_on_uid", using: :btree
    t.index ["user_id"], name: "index_facebook_profiles_on_user_id", using: :btree
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
    t.boolean  "up_sale",                                  default: false
    t.index ["menu_category_id"], name: "index_menu_items_on_menu_category_id", using: :btree
  end

  create_table "order_menu_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "menu_item_id"
    t.integer  "bonus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["menu_item_id"], name: "index_order_menu_items_on_menu_item_id", using: :btree
    t.index ["order_id"], name: "index_order_menu_items_on_order_id", using: :btree
  end

  create_table "order_presents", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "present_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_presents_on_order_id", using: :btree
    t.index ["present_id"], name: "index_order_presents_on_present_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_orders_on_place_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "place_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "place_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_images_on_place_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.text     "phones"
    t.string   "logo"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "color"
    t.string   "site"
    t.text     "working_hours"
    t.boolean  "in_pocket",          default: false
    t.string   "category"
    t.integer  "bonus_part",         default: 10
    t.string   "card_image"
    t.string   "pos_terminal_type"
    t.integer  "pos_terminal_id"
    t.integer  "category_record_id"
    t.index ["category_record_id"], name: "index_places_on_category_record_id", using: :btree
    t.index ["pos_terminal_id", "pos_terminal_type"], name: "index_places_on_pos_terminal_id_and_pos_terminal_type", unique: true, using: :btree
    t.index ["pos_terminal_type", "pos_terminal_id"], name: "index_places_on_pos_terminal_type_and_pos_terminal_id", using: :btree
  end

  create_table "pos_terminal_posters", force: :cascade do |t|
    t.string   "account"
    t.string   "access_token"
    t.integer  "waiter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "presents", force: :cascade do |t|
    t.string   "image"
    t.integer  "price"
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

  create_table "user_scores", force: :cascade do |t|
    t.integer  "bonus",      default: 0
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["place_id"], name: "index_user_scores_on_place_id", using: :btree
    t.index ["user_id"], name: "index_user_scores_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "signed",          default: false
    t.string   "photo"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email"
    t.string   "password_digest", default: ""
    t.string   "referal_number"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["referal_number"], name: "index_users_on_referal_number", using: :btree
  end

  create_table "vk_profiles", force: :cascade do |t|
    t.bigint   "uid"
    t.string   "email"
    t.integer  "gender"
    t.string   "username"
    t.date     "birthday"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_vk_profiles_on_uid", using: :btree
    t.index ["user_id"], name: "index_vk_profiles_on_user_id", using: :btree
  end

end
