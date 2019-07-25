class Ability < ApplicationRecord
  belongs_to :user
  
  has_many :model_abilities, dependent: :destroy
  has_many :models, through: :model_abilities

  has_many :unit_abilities, dependent: :destroy
  has_many :units, through: :unit_abilities

  validates :name, presence: true
  validates :name, uniqueness: true
end