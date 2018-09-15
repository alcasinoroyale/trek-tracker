class Hiker < ApplicationRecord
  has_many :aspirations
  has_many :trails, through: :aspirations

  has_secure_password

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    where(:username => auth_hash.info.first_name).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def number_trails_completed
    length = aspirations.where(completed: true).length
    if length > 1 || 0
      length.to_s + " trails"
    else
      length.to_s + " trail"
    end
  end

end
