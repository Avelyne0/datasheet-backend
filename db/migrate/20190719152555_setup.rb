class Setup < ActiveRecord::Migration[5.2]
  def change
    create_table "abilities", force: :cascade do |t|
      t.string "name"
      t.string "content"
    end
  
    create_table "faction_keywords", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "keywords", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
  
    create_table "users", id: :serial, force: :cascade do |t|
      t.string "email"
      t.string "password_digest"
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_users_on_email"
    end
  
    create_table "wargear_options", force: :cascade do |t|
      t.string "option"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "model_id"
      t.bigint "unit_id"
      t.index ["model_id"], name: "index_wargear_options_on_model_id"
      t.index ["unit_id"], name: "index_wargear_options_on_unit_id"
    end
  
    create_table "weapons", force: :cascade do |t|
      t.string "weapon_name"
      t.integer "weapon_range"
      t.string "weapon_type"
      t.integer "weapon_strength"
      t.integer "armour_piercing"
      t.string "weapon_damage"
      t.string "weapon_ability"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "points"
    end
  
    add_foreign_key "units", "users"
    add_foreign_key "wargear_options", "models"
    add_foreign_key "wargear_options", "units"
  end
end
