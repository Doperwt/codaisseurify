class Api::ArtistsController < ApplicationController
  before_action :set_artist
  def show
    render status: 200, json: {
      artist: @artist
      songs: @songs
    }.to_json
  end
  def destroy

    if

    else

    end
  end
  def set_artist
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all
  end
end
