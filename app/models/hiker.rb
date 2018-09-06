class Hiker < ApplicationRecord
  has_many :aspirations
  has_many :trails, through: :aspirations

  has_secure_password

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true
end
