class AlbumsController < ApplicationController
  def index
  	@albums = Album.order("Name")
  end

  def show
  	@album = Album.find(params[:id])
  end
end
