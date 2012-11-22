class GenresController < ApplicationController
  def index
  	@genres = Genre.order("Name")
  end

  def show
  	@genre = Genre.find(params[:id])
  end
end
