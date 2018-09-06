class Trail < ApplicationRecord
  has_many :aspirations
  has_many :hikers, through: :aspirations

  validates :name, :location, presence: true
  validates :name, uniqueness: true

end
