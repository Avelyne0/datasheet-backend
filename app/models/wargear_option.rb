class WargearOption < ApplicationRecord

  belongs_to :user

  belongs_to :models
  belongs_to :units
end