class AlbumsController < ApplicationController
  def index
  	@albums = Album.where("release_date <= ?", Time.now).order("Name")
  end

  def show
    begin
  	 @album = Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.debug "Album Record Not Found"
      redirect_to albums_path, :notice => "Record Not Found"
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
      logger.debug "Album Record Not Found"
      redirect_to albums_path, :notice => "Record Not Found"
    end
  end

  def update
  	@album = Album.find(params[:id])
  	if @album.update_attributes!(params[:album])
  		redirect_to @album
  	else
  		redirect_to :edit, :notice => "Update Failed! Please try again!"
  	end
  end

  def addTracks
    @album = Album.find(params[:id])
    @genres = Genre.all.order("Name ASC")
    @track = Track.new
  end
end
