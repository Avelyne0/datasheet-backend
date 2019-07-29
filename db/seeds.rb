# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

users = User.create([
  {email: 'avelyne@me.com', password: 'password'}
])
weapons = Weapon.create([ 
  { name: 'Arc Pistol', weapon_range: 12, weapon_type: 'Pistol 1', weapon_strength: 6, armour_piercing: '-1', weapon_damage: 1, weapon_ability: 'When attacking a <VEHICLE>, this weapon has a Damage of D3', user_id: 1},
  { name: 'Arc Rifle', weapon_range: 24, weapon_type: 'Rapid Fire 1', weapon_strength: 6, armour_piercing: '-1', weapon_damage: 1, weapon_ability: 'When attacking a <VEHICLE>, this weapon has a Damage of D3', user_id: 1},
  { name: 'Avenger Gattling Cannon', weapon_range: 36, weapon_type: 'Heavy 12', weapon_strength: 6, armour_piercing: '-2', weapon_damage: 2, weapon_ability: '-', user_id: 1},
  { name: 'Cognis Heavy Stubber', weapon_range: 36, weapon_type: 'Heavy 3', weapon_strength: 4, armour_piercing: '0', weapon_damage: 1, weapon_ability: 'You may fire this weapon even if the firing model has Advanced but you must subtract 2 from any hit rolls if you do so', user_id: 1},
])

abilities = Ability.create([
  { name: 'Ion Shield', content: 'This model has a 5+ invulnerable save against shooting attacks', user_id: 1},
  { name: 'Explodes', content: 'If this model is reduced to 0 wounds, roll a D6 before removing it from the battlefield. On a 6 it explodes, and each unit within 2D6" suffers D6 mortal wounds.', user_id: 1},
  { name: 'Bionics', content: 'All models in this unit have a 6+ invulnerable save.', user_id: 1}
])

models = Model.create([
  { name: 'Skitarii Vanguard', movement: 6, weapon_skill: 4, ballistic_skill: 3, strength:  3, toughness: 3, wounds: 1, attacks: 1, leadership: 6, armour_save: 4, user_id: 1},
  { name: 'Vanguard Alpha', movement: 6, weapon_skill: 4, ballistic_skill: 3, strength:  3, toughness: 3, wounds: 1, attacks: 2, leadership: 7, armour_save: 4, user_id: 1}
])

model_abilities = ModelAbility.create([
  { model_id: 1, ability_id: 3}
])

model_weapons = ModelWeapon.create([
  { model_id: 1, weapon_id: 1}
])