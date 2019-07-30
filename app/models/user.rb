class User < ApplicationRecord
  has_secure_password
  
  validates :email, uniqueness: { case_sensitive: false }
    
  has_many :abilities
  has_many :faction_keywords
  has_many :keywords
  has_many :models
  has_many :units
  has_many :wargear_options
  has_many :weapons
end