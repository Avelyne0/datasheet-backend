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

ActiveRecord::Schema.define(version: 2019_07_29_165951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_abilities_on_user_id"
  end

  create_table "faction_keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_faction_keywords_on_user_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_keywords_on_user_id"
  end

  create_table "model_abilities", id: false, force: :cascade do |t|
    t.bigint "model_id"
    t.bigint "ability_id"
    t.index ["ability_id"], name: "index_model_abilities_on_ability_id"
    t.index ["model_id"], name: "index_model_abilities_on_model_id"
  end

  create_table "model_keywords", id: false, force: :cascade do |t|
    t.bigint "model_id"
    t.bigint "keyword_id"
    t.index ["keyword_id"], name: "index_model_keywords_on_keyword_id"
    t.index ["model_id"], name: "index_model_keywords_on_model_id"
  end

  create_table "model_weapons", id: false, force: :cascade do |t|
    t.bigint "model_id"
    t.bigint "weapon_id"
    t.index ["model_id"], name: "index_model_weapons_on_model_id"
    t.index ["weapon_id"], name: "index_model_weapons_on_weapon_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "movement"
    t.integer "weapon_skill"
    t.integer "ballistic_skill"
    t.integer "strength"
    t.integer "toughness"
    t.integer "wounds"
    t.integer "attacks"
    t.integer "leadership"
    t.integer "armour_save"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_models_on_user_id"
  end

  create_table "unit_abilities", id: false, force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "ability_id"
    t.index ["ability_id"], name: "index_unit_abilities_on_ability_id"
    t.index ["unit_id"], name: "index_unit_abilities_on_unit_id"
  end

  create_table "unit_faction_keywords", id: false, force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "faction_keyword_id"
    t.index ["faction_keyword_id"], name: "index_unit_faction_keywords_on_faction_keyword_id"
    t.index ["unit_id"], name: "index_unit_faction_keywords_on_unit_id"
  end

  create_table "unit_models", id: false, force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "model_id"
    t.index ["model_id"], name: "index_unit_models_on_model_id"
    t.index ["unit_id"], name: "index_unit_models_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.text "composition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "name"
    t.index ["user_id"], name: "index_units_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wargear_options", force: :cascade do |t|
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.bigint "unit_id"
    t.bigint "user_id"
    t.index ["model_id"], name: "index_wargear_options_on_model_id"
    t.index ["unit_id"], name: "index_wargear_options_on_unit_id"
    t.index ["user_id"], name: "index_wargear_options_on_user_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "weapon_range"
    t.string "weapon_type"
    t.integer "weapon_strength"
    t.integer "armour_piercing"
    t.string "weapon_damage"
    t.string "weapon_ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_weapons_on_user_id"
  end

end
