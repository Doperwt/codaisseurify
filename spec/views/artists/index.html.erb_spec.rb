require 'rails_helper'

describe "artists/index.html.erb" do
  artist1 = Artist.create
  artist2 = Artist.create
  artist3 = Artist.create

  it "has first and last artist" do
    render
    expect(rendered).to have_content Artist.first
    expect(rendered).to have_content Artist.second
    expect(rendered).to have_content Artist.last
  end


end
