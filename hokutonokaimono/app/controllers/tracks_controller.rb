class TracksController < ApplicationController
  def index
  	@tracks = Track.order("Title ASC")
  end

  def show
  	require "mp3info"
  	require "ogginfo"
  	@track = Track.find(params[:id])
  end
end
