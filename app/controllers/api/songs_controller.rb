class Api::SongsController < ApplicationController
  def create
    set_artist
    @song = Song.new(song_params)
    @song.artist = @artist
    if @song.save
      render status: 201, json:{ name:@song.name, duration:@song.duration,id: @song.id, artist_id: @artist.id}.to_json
    else
      render status: 422, json:{ errors:@song.errors}.to_json
    end

  end
  def destroy
    set_song_artist
  end
  private
  def song_params
     params.require(:song).permit( :name, :duration)
  end
  def set_song_artist
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist.id)
  end
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
