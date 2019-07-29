class Model < ApplicationRecord

  belongs_to :user

  has_many :model_abilities, dependent: :destroy
  has_many :abilities, through: :model_abilities

  has_many :model_keywords, dependent: :destroy
  has_many :keywords, through: :model_keywords

  has_many :model_weapons, dependent: :destroy
  has_many :weapons, through: :model_weapons
  accepts_nested_attributes_for :weapons

  has_many :unit_models, dependent: :destroy
  has_many :units, through: :unit_models

  def weapon_ids=(ids)
    ids.each {|id| ModelWeapon.create(model_id: self.id, weapon_id: id)}
  end

  def keyword_ids=(ids)
    ids.each {|id| ModelKeyword.create(model_id: self.id, keyword_id: id)}
  end

  def ability_ids=(ids)
    ids.each {|id| ModelAbility.create(model_id: self.id, ability_id: id)}
  end

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :wargear_options, dependent: :destroy
end
