class Hiker < ApplicationRecord
  has_many :aspirations
  has_many :trails, through: :aspirations

  has_secure_password
end
