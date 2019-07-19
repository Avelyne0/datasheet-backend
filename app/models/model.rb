class Model < ApplicationRecord
  has_many :model_abilities, dependent: :destroy
  has_many :abilities, through: :model_abilities

  has_many :model_keywords, dependent: :destroy
  has_many :keywords, through: :model_keywords

  has_many :model_weapons, dependent: :destroy
  has_many :weapons, through: :model_weapons
  accepts_nested_attributes_for :weapons

  has_many :unit_models, dependent: :destroy
  has_many :units, through: :unit_models

  def weapons_attributes=(weapon_attributes)
    weapon_attributes.values.each do |weapon_attribute|
      weapon = Weapon.find_or_create_by(weapon_attribute)
      self.model_weapons.build(weapon: weapon)
    end
  end

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :wargear_options, dependent: :destroy
end
