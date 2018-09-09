class Aspiration < ApplicationRecord
  belongs_to :trail
  belongs_to :hiker

  validate :unique_trail

  def unique_trail
    hiker = Hiker.find_by(id: hiker_id)
    if hiker.trails.where(id: trail_id).present?
      errors.add(:trail_id, "You've already aspired to hike this trail.")
    end
  end
end
