class Keyword < ApplicationRecord
  has_many :model_keywords, dependent: :destroy
  has_many :models, through: :model_keywords

  validates :name, presence: true
  validates :name, uniqueness: true
end
