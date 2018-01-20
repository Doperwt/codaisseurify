class SongsController < ApplicationController
 before_action :set_artist
  def create
    set_artist
    @song = @artist.songs.build(song_params.merge({artist:@artist}))
    if @song.save
      redirect_to artist_path(@artist.id), notice: "song added"
    else
    end
  end
  private
  def song_params
     params.require(:song).permit( :name, :duration)
  end
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
