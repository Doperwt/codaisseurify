class ArtistsController < ApplicationController
  before_action :all_artists, only: [:index]
  before_action :set_artist, only: [:show,:destroy]
  def index ; end
  def show
    @song = @artist.songs.build
  end

  def destroy
    @artist.destroy
    redirect_to root_path, notice: "artist successfully deleted, you monster"
  end

  private
  def all_artists
    @artists = Artist.all
  end
  def set_artist
    @artist = Artist.find(params[:id])
    @songs = Song.where(artist:@artist)
  end
end
