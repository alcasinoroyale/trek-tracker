class Aspiration < ApplicationRecord
  belongs_to :trail
  belongs_to :hiker
  accepts_nested_attributes_for :trail

  validate :unique_trail

  def unique_trail
    hiker = Hiker.find_by(id: hiker_id)
    if hiker.trails.where(id: trail_id).present?
      errors.add(:trail_id, "You've already aspired to hike this trail.")
    end
  end

  def trail_attributes=(trail_attributes)
    trail = Trail.find_or_create_by(trail_attributes)
    self.trail = trail
  end
end

    # category_attributes.values.each do |category_attribute|
    #   category = Category.find_or_create_by(category_attribute)
    #   self.categories << category
    # end
