class ArtistsController < ApplicationController
  before_action :all_artists, only: [:index]
  before_action :set_artist, only: [:show,:destroy]
  def index
    need_sort

  end
  def show
  end

  def destroy
    @artist.destroy
    redirect_to root_path, notice: "artist successfully deleted, you monster"
  end

  private
  def all_artists
    @search = params[:search]
    @artists = Artist.all
  end
  def set_artist
    @artist = Artist.find(params[:id])
    @songs = Song.where(artist:@artist)
  end
  def need_sort
    case @search
    when "Name Ascending"
      @artists.order!(name: :asc )
    when "Name Descending"
      @artists.order!(name: :desc)
    when "Created Ascending"
      @artists.order!(created_at: :asc )
    when "Created Descending"
      @artists.order!(created_at: :desc )
    else
      @artists.order!(name: :asc)
    end
  end
end
