class ArtistsController < ApplicationController
  def index
    all_artists
  end
  private
  def all_artists
    @artists = Artist.all
  end
end
