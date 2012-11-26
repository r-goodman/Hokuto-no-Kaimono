class AlbumsController < ApplicationController
  def index
  	@albums = Album.where("release_date <= ?", Time.now).order("Name")
  end

  def show
    begin
  	 @album = Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.debug "Album Record Not Found - Controller: Albums || Method: Show"
      redirect_to albums_path, :notice => "Album Not Found."
    end
  end

  def new
  	@album = Album.new
  end

  def create
  	a = Album.new(params[:album]) 
  	if a.save
  		redirect_to addTracks, :id => a.id
  	else
  		redirect_to :new
  	end
  end

  def edit
    begin
     @album = Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.debug "Album Record Not Found - Controller: Albums || Method: Edit"
      redirect_to albums_path, :notice => "Album Not Found."
    end
  end

  def update
    begin
    	@album = Album.find(params[:id])
      if @album.update_attributes!(params[:album])
        redirect_to @album, :notice => "Update Successful!"
      else
        redirect_to :edit, :notice => "Update Failed!"
      end
    rescue ActiveRecord::RecordNotFound
      logger.debug "Album Record Not Found - Controller: Albums || Method: Update"
      redirect_to albums_path, :notice => "Album Not Found."
    end
  end

  def addTracks
    @album = Album.find(params[:id])
    @genres = Genre.all.order("Name ASC")
    @track = Track.new
  end
end
