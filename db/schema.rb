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

ActiveRecord::Schema.define(version: 20161207204537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "user_id"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expires_at"
    t.string   "username"
    t.text     "params"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["provider_id"], name: "index_authentications_on_provider_id", using: :btree
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "position",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["follower_id"], name: "index_follows_on_follower_id", using: :btree
    t.index ["following_id", "follower_id"], name: "index_follows_on_following_id_and_follower_id", unique: true, using: :btree
    t.index ["following_id"], name: "index_follows_on_following_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "tag_id"
    t.string   "image_url"
    t.string   "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_products_on_tag_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "info"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "website"
    t.string   "phone"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "position",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "brand_id"
    t.index ["brand_id"], name: "index_services_on_brand_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "account_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_url"
    t.string   "avatar_cloudinary_id"
    t.boolean  "share_facebook"
    t.boolean  "share_twitter"
    t.boolean  "share_instagram"
    t.boolean  "share_pinterest"
    t.boolean  "share_tumblr"
    t.text     "prof_desc"
    t.integer  "years_exp"
    t.integer  "salon_id"
    t.text     "career_opportunity"
    t.string   "auth_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["salon_id"], name: "index_users_on_salon_id", using: :btree
  end

  add_foreign_key "authentications", "providers"
  add_foreign_key "authentications", "users"
  add_foreign_key "products", "tags"
  add_foreign_key "services", "brands"
  add_foreign_key "users", "salons"
end
