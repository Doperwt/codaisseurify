class SongsController < ApplicationController
  def create
    set_artist
    @song = @artist.songs.build(song_params)
    if @song.save
      redirect_to artist_path(@artist.id), notice: "song added"
    else
    end
  end
  # def destroy
  #   set_song_artist
  #   @song.destroy
  #   redirect_to artist_path(@artist), notice: "song successfully deleted"
  # end
  private
  def song_params
     params.require(:song).permit( :name, :duration)
  end
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
  def set_song_artist
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist.id)
  end
end
