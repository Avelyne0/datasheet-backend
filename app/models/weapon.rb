class Weapon < ApplicationRecord
  has_many :model_weapons, dependent: :destroy
  has_many :models, through: :model_weapons
  validates :weapon_name, presence: true
  validates :weapon_name, uniqueness: true
end
