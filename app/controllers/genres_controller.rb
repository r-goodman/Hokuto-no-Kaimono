class GenresController < ApplicationController
  def index
  	@genres = Genre.order("Name")
  end

  def show
  	begin
  		@genre = Genre.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
      logger.debug "Genre Record Not Found - Controller: Genres || Method: Show"
      redirect_to genres_path, :alert => "Genre Not Found."
  end
end
