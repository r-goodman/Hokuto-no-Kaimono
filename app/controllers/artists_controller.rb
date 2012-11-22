class ArtistsController < ApplicationController
  def index
  	@artists = Artist.order("Name")
  end

  def show
  	@artist = Artist.find(params[:id])
  end

  def edit
  	@artist = current_user.artist
  end

  def update
  	@artist = current_user.artist
  	if @artist.update_attributes!(params[:artist])
  		redirect_to @artist
  	else
  		redirect_to :edit, :notice => "Update Failed! Please try again"
  	end
  end

  def sales
    @artist = Artist.find(params[:id])
    @tracks = Track.find_all_by_artist_id(current_user.artist.id)
  end
end
