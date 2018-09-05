class Trail < ApplicationRecord
  has_many :aspirations
  has_many :hikers, through: :aspirations
end
