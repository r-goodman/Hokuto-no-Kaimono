class LineItemsController < ApplicationController

	before_filter :current_user

	  def create
	      track = Track.find(params[:track_id])
	      unless LineItem.find_by_track_id_and_basket_id(track.id, current_basket.id)
	        line_item = LineItem.create!(:basket => current_basket, :track => track, :unit_price => track.price)
	          flash[:notice] = "Added #{track.title} to cart."
	          redirect_to basket_show_path
	    else          
	        flash[:notice] = "#{track.title} is already in your cart."
	          redirect_to basket_show_path
	      end
	  end

	  def album
	      album = Album.find(params[:album_id])
	      album.tracks.each do |track|
	          unless LineItem.find_by_track_id_and_basket_id(track.id, current_basket.id)
	              line_item = LineItem.create!(:basket => current_basket, :track => track, :unit_price => track.price)
	          end
	      end
	      redirect_to basket_show_path
	  end

	  def remove
	      track_id = Track.find(params[:track_id])
	      line_item_to_remove = LineItem.find_by_track_id_and_basket_id(track_id, current_basket.id)
	      line_item_to_remove.delete

	      redirect_to basket_show_path, :alert => "Track has been removed from your basket"
	  end

	  def empty
	      line_items_to_remove = LineItem.find_all_by_basket_id(current_basket.id)
	      line_items_to_remove.each do |line_item|
	          line_item.delete
	      end
	      redirect_to basket_show_path, :alert => "Your basket is now empty"
	  end
end
