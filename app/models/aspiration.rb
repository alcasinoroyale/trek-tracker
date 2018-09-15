class Aspiration < ApplicationRecord
  belongs_to :trail
  belongs_to :hiker
  accepts_nested_attributes_for :trail, reject_if: :reject_trails

  validate :unique_trail, :on => :create

  scope :hiker_leaderboard, -> { joins(:hiker).where(:completed => "true").group(:username).count.sort_by {|k, v| v}.reverse.to_h }

  def completed_status
    if completed
      "Complete"
    else
      "Incomplete"
    end
  end

  def change_status
    update(completed: !self.completed)
    save
  end

  def unique_trail
    hiker = Hiker.find_by(id: hiker_id)
    if hiker.trails.where(id: trail_id).present?
      errors.add(:trail_id, "You've already aspired to hike this trail.")
    end
  end

  def reject_trails(attributes)
    attributes[:name].blank? || attributes[:location].blank?
  end

  def trail_attributes=(trail_attributes)
    unless reject_trails(trail_attributes)
      trail = Trail.find_or_create_by(trail_attributes)
      self.trail = trail
    end
  end
end
