class Weapon < ApplicationRecord

  belongs_to :user

  has_many :model_weapons, dependent: :destroy
  has_many :models, through: :model_weapons
  validates :name, presence: true
  validates :name, uniqueness: true
end
