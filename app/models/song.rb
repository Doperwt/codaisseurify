class Song < ApplicationRecord
  belongs_to :artist
  validates :name
  validates :description
  validates :duration
end
