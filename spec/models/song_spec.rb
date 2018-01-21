require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it "is invalid without name" do
      song = Song.new(name: "")
      song.valid?
      expect(song.errors).to have_key(:name)
    end
    it "is invalid without duration" do
      song = Song.new(duration: "")
      song.valid?
      expect(song.errors).to have_key(:duration)
    end
  end
  describe "song duraton in minutes" do
    it "List duration in minutes and seconds" do
      song = Song.new(duration: 150)
      expect(song.time_in_minutes).to eq("2 minutes and 30 seconds")
    end

  end
  describe "associations" do
    let!(:song){create :song}
    it "song has artist" do
      song.valid?
      expect(song.errors).not_to have_key(:artist)
    end
    it "song does not have artist" do
      song = Song.new(artist: nil)
      song.valid?
      expect(song.errors).to have_key(:artist)
    end
  end
end
