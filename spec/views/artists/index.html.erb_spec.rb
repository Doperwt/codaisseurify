require 'rails_helper'

describe "artists/index.html.erb" do
  let!(:artist) { create :artist }
  let!(:artist2) { create :artist }
  let!(:artist3) { create :artist }

  it "has first and last artist" do
    @artists = [artist,artist2,artist3]
    render
    expect(rendered).to have_content Artist.first.name
    expect(rendered).to have_content Artist.second.name
    expect(rendered).to have_content Artist.last.name
  end
end
