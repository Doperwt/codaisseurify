require 'rails_helper'
RSpec.describe Photo, type: :model do

  describe "associations" do
    let!(:photo){create :photo}
    it "photo has artist" do
      photo.valid?
      expect(photo.errors).not_to have_key(:artist)
    end
    it "photo does not have artist" do
      photo = Photo.new(artist: nil)
      photo.valid?
      expect(photo.errors).to have_key(:artist)
    end
  end
end
