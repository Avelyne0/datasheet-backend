class Model < ApplicationRecord

  belongs_to :user

  has_many :model_abilities, dependent: :destroy
  has_many :abilities, through: :model_abilities

  has_many :model_keywords, dependent: :destroy
  has_many :keywords, through: :model_keywords

  has_many :model_weapons, dependent: :destroy
  has_many :weapons, through: :model_weapons

  has_many :unit_models, dependent: :destroy
  has_many :units, through: :unit_models

  def weapon_ids=(ids)
    ids.each  do |id| 
      mw = ModelWeapon.create(model: self, weapon_id: id)
      # if (!mw.valid?)
      #   byebug
      # end
    end
  end

  def keyword_ids=(ids)
    ids.each do |id| 
      mk = ModelKeyword.create(model: self, keyword_id: id)
    end
  end

  def ability_ids=(ids)
    ids.each do |id| 
      ma = ModelAbility.create(model: self, ability_id: id)
    end
  end

  validates :name, presence: true

  has_many :wargear_options, dependent: :destroy
end
