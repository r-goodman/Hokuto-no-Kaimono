class TracksController < ApplicationController
  def index
  	@tracks = Track.where("release_date <= ?", Time.now).order("Title ASC")
  end

  def show
  	@track = Track.find(params[:id])
  end

  def new
    @genres = Genre.all.order("Name ASC")
  	@track = Track.new
  end

  def create
  	t = Track.new(params[:track]) 
  	if t.save
  		redirect_to t
  	else
  		redirect_to :new
  	end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes!(params[:track])
      redirect_to @track
    else
      flash[:notice] = @track.errors
      redirect_to :edit, :notice => "Update Failed! Please try again"
    end
  end
end
