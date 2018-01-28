require 'rails_helper'

feature Artist, js: true do
  let!(:artist) { create :artist }
  let!(:photo) { create :photo, artist: artist}
  let!(:song1) { create :song, artist: artist }
  let!(:song2) { create :song, artist: artist }
  let!(:artist2) { create :artist }
  let!(:photo2) { create :photo, artist: artist2}

  scenario "deleting songs" do

    @artist = artist
    @songs = [song1,song2]
    visit artist_path(@artist)
    page.execute_script("$('.delete_song[id=#{@artist.songs.first.id}]').click()")
    expect(page).not_to have_content(@songs.first.name)
  end
  scenario "deleting all songs" do
    @artist = artist
    @songs = [song1,song2]
    visit artist_path(@artist)
    page.execute_script("$('#delete_all_songs').click()")
    expect(page).not_to have_content(@songs.first.name)
    expect(page).not_to have_content(@songs.second.name)
  end
  scenario "adding a songs" do
    @artist = artist
    @songs = [song1,song2]
    visit artist_path(@artist)
    fill_in 'song_name', with: 'Eat a cheese burger'
    fill_in 'song_duration', with: '15'
    page.execute_script("$('#submit_song').submit()")
    expect(page).to have_content('Eat a cheese burger')

  end
  scenario "delete artist" do
    @artists = [artist,artist2]
    @artist = artist
    @songs = [song1,song2]
    @photo2 = photo2
    @photo1 = photo
    visit artist_path(@artist)
    page.execute_script("$('#delete_artist').click()")
    expect(page).not_to have_content(@artist.name)
  end
end
