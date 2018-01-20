class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_one :photo, dependent: :destroy
  validates :name, presence: true, length: { maximum:50 }
  validates :bio , presence: true, length: { maximum: 50}
end
