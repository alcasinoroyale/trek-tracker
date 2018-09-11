class Hiker < ApplicationRecord
  has_many :aspirations
  has_many :trails, through: :aspirations

  has_secure_password

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true

  def number_trails_completed
    length = aspirations.where(completed: true).length
    if length > 1
      length.to_s + " trails"
    else
      length.to_s + " trail"
    end
  end
end
