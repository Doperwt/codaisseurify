class Song < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  validates :duration, presence: true
  def time_in_minutes
    return  "#{self.duration/60} and #{self.duration%60} seconds"
  end

end
