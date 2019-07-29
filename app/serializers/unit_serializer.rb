class UnitSerializer < ActiveModel::Serializer
  attributes :id, :composition, :name, :models, :abilities, :faction_keywords
  has_many :models
  def user
    UserSerializer.new(self.object.user)
  end

  def models
    self.object.models.map do |model|
      {
        id: model.id
        name: model.name
        movement: model.movement
        weapon_skill: model.weapon_skill
        ballistic_skill: model.ballistic_skill
        strength: model.strength
        toughness: model.toughness
        wounds: model.wounds
        attacks: model.attacks
        leadership: model.leadership
        armour_save: model.armour_save
        model.weapons.map do |weapon|
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
        model.abilities.map do |ability|
          {
            id: ability.id,
            name: ability.name,
            content: ability.content
          }
        end
        model.keywords.map do |keyword|
          {
            name: keyword.name
          }
        end
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

  def faction_keywords
    self.object.faction_keywords.map do |faction_keyword|
      {
        id: faction_keyword.id
        name: faction_keyword.name
      }
    end
  end

end

