class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :keywords, :movement, :weapon_skill, :ballistic_skill, :strength, :toughness, :wounds, :attacks, :leadership, :armour_save, :points, :keywords, :abilities, :weapons
  
  def user
    UserSerializer.new(self.object.user)
  end

  def self.all
    Model.all.map do |model|
      ModelSerializer.new(model)
    end
  end

  def weapons
    self.object.weapons.map do |weapon|
      WeaponSerializer.new(weapon)
    end
  end

  def abilities
    self.object.abilities.map do |ability|
      AbilitySerializer.new(ability)
    end
  end

  def keywords
    self.object.keywords.map do |keyword|
      KeywordSerializer.new(keyword)
    end
  end
end
