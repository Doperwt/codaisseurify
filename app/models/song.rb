class Song < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  validates :duration, presence: true
end
