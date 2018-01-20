class ArtistsController < ApplicationController
  before_action :all_artists, only: [:index]
  before_action :set_artist, only: [:show]
  def index ; end
  def show ; end

  def destroy
  end

  private
  def all_artists
    @artists = Artist.all
  end
  def set_artist
    @artist = Artist.find(params[:id])
    @songs = Song.where(artist:@artist)
    @artist.load_photos
  end
end
