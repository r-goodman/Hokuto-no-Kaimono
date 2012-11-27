class ArtistsController < ApplicationController
  def index
  	@artists = Artist.order("Name")
  end

  def show
    begin
  	  @artist = Artist.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.debug "Artist Record Not Found - Controller: Artists || Method: Show"
      redirect_to artists_path, :alert => "Artist Not Found."
    end
  end

  def edit
    begin
  	 @artist = current_user.artist
    rescue ActiveRecord::RecordNotFound
      logger.debug "Artist Record Not Found - Controller: Artists || Method: Edit"
      redirect_to artists_path, :alert => "Artist Not Found."
    end
  end

  def update
    begin
    	@artist = current_user.artist
    	if @artist.update_attributes!(params[:artist])
    		redirect_to @artist, :notice => "Update Successful!"
    	else
    		redirect_to :edit, :alert => "Update Failed!"
    	end
    rescue ActiveRecord::RecordNotFound
      logger.debug "Artist Record Not Found - Controller: Artists || Method: Update"
      redirect_to artists_path, :alert => "Artist Not Found."
    end
  end

  def sales
    @artist = Artist.find(params[:id])
    @tracks = Track.find_all_by_artist_id(current_user.artist.id)
  end
end
