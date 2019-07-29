class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :movement, :weapon_skill, :ballistic_skill, :strength, :toughness, :wounds. :attacks, :leadership, :armour_save, :points, :units, :keywords, :abilities, :weapons

  def user
    UserSerializer.new(self.object.user)
  end

  def units
    self.object.units.map do |unit|
      {
        id: unit.id,
        name: unit.name,
        composition: unit.composition,
        models: unit.models,
        abilities: unit.abilities,
        faction_keywords: unit.faction_keywords
      }
    end
  end

  def weapons
    self.object.weapons.map do |weapon|
      {
        id: weapon.id,
        name: weapon.name,
        weapon_range: weapon.weapon_range,
        weapon_type: weapon.weapon_type,
        weapon_strength: weapon.weapon_strength,
        armour_piercing: weapon.armour_piercing,
        weapon_damage: weapon.weapon_damage,
        weapon_ability: weapon.weapon_ability
      }
    end
  end

  def abilities
    self.object.abilities.map do |ability|
      {
        id: ability.id,
        name: ability.name,
        content: ability.content
      }
    end
  end

  def keywords
    self.object.keywords.map do |keyword|
      {
        id: keyword.id
        name: keyword.name
      }
    end
  end
end
