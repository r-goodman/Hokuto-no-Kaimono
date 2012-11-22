class ArtistsController < ApplicationController
  def index
  	@artists = Artist.order("Name")
  end

  def show
  	@artist = Artist.find(params[:id])
  end
end
