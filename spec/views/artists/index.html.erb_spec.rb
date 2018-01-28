require 'rails_helper'

describe "artists/index.html.erb" do
  let!(:artist) { create :artist }
  let!(:artist2) { create :artist }
  let!(:artist3) { create :artist }
  let!(:photo) { create :photo, artist: artist}
  let!(:photo2) { create :photo, artist: artist2}
  let!(:photo3) { create :photo, artist: artist3}

  it "has first and last artist" do
    @artists = [artist,artist2,artist3]
    render
    expect(rendered).to have_content Artist.find(@artists.first.id).name
    expect(rendered).to have_content Artist.find(@artists.second.id).name
    expect(rendered).to have_content Artist.find(@artists.last.id).name
  end
end
