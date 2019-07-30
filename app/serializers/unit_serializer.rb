class UnitSerializer < ActiveModel::Serializer
  attributes :id, :composition, :name, :abilities, :faction_keywords, :models
  
  def user
    UserSerializer.new(self.object.user)
  end

  def self.all
    Unit.all.map do |unit|
     UnitSerializer.new(unit)
    end
  end 

  def models
    self.object.models.map do |model|
      ModelSerializer.new(model)
    end
  end

  def abilities
    self.object.abilities.map do |ability|
      AbilitySerializer.new(ability)
    end
  end

  def faction_keywords
    self.object.faction_keywords.map do |faction_keyword|
      FactionKeywordSerializer.new(faction_keyword)
    end
  end
end

