class Unit < ApplicationRecord
  has_many :unit_models, dependent: :destroy
  has_many :models, through: :unit_models

  has_many :unit_faction_keywords, dependent: :destroy
  has_many :faction_keywords, through: :unit_faction_keywords

  has_many :unit_abilities, dependent: :destroy
  has_many :abilities, through: :unit_abilities
  
  has_many :wargear_options, dependent: :destroy
end