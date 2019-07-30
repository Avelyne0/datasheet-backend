class Unit < ApplicationRecord

  belongs_to :user

  has_many :unit_models, dependent: :destroy
  has_many :models, through: :unit_models

  has_many :unit_faction_keywords, dependent: :destroy
  has_many :faction_keywords, through: :unit_faction_keywords

  has_many :unit_abilities, dependent: :destroy
  has_many :abilities, through: :unit_abilities
  
  has_many :wargear_options, dependent: :destroy

  def model_ids=(ids)
    ids.each do |id| 
      um = UnitModel.create(unit: self, model_id: id)
    end
  end

  def faction_keyword_ids=(ids)
    ids.each do |id| 
      ufk = UnitFactionKeyword.create(unit: self, faction_keyword_id: id)
    end
  end

  def ability_ids=(ids)
    ids.each do |id| 
      ua = UnitAbility.create(unit: self, ability_id: id)
    end
  end
end


