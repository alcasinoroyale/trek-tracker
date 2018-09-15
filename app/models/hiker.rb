class Hiker < ApplicationRecord
  has_many :aspirations
  has_many :trails, through: :aspirations

  has_secure_password

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_name = auth_hash.info.first_name
    if hiker = Hiker.find_by(username: oauth_name)
      return hiker
    else
      hiker = Hiker.create(username: oauth_name, password: SecureRandom.hex)
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
