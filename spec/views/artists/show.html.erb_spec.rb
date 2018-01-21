require 'rails_helper'

describe "artists/show.html.erb" do
  let!(:artist) { create :artist }
  let!(:photo) { create :photo, artist: artist}
  let!(:song1) { create :song, artist: artist }
  let!(:song2) { create :song, artist: artist }

  it "has bio" do
    @artist = artist
    @songs = [song1,song2]
    @song = Song.new
    render
    expect(rendered).to have_content artist.bio
  end
  it "has name" do
    @artist = artist
    @songs = [song1,song2]
    @song = Song.new
    render
    expect(rendered).to have_content artist.name
  end
  it "has songs" do
    @artist = artist
    @songs = [song1,song2]
    @song = Song.new
    render
    expect(rendered).to have_content song1.name
    expect(rendered).to have_content song2.name
  end
end
