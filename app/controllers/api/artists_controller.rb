class Api::ArtistsController < ApplicationController
  def show
    set_artist
    render status: 200, json: {
      artist: @artist,
      songs: @songs
    }.to_json
  end
  def destroy
    @artist = Artist.find(params[:id])
    artist_id = @artist.id
    @artist.destroy
    render status:200 , json:{ id:artist_id, notice:"artist removed"}
  end


  private
  def set_artist
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all
  end


end
