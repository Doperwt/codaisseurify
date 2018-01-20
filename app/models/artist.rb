class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :name, presence: true, length: { maximum:50 }
  validates :bio , presence: true, length: { maximum: 50}
  def load_photos
    @photos = Photo.where(artist:@artist)
  end
end
