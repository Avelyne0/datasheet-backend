class FactionKeyword < ApplicationRecord
  has_many :unit_faction_keywords, dependent: :destroy
  has_many :units, through: :unit_faction_keywords

  validates :name, presence: true
  validates :name, uniqueness: true
end
