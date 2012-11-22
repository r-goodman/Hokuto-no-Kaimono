class BasketController < ApplicationController

	def addTrackToBasket
		if current_user.nil?
			redirect_to '/users/login'
		else
			@basket = findBasket
			track = Track.find(params[:id])
			@basket.addToBasket(track.id)
			redirect_to basket_index_path
		end
	end

	def addAlbumToBasket 
		if current_user.nil?
			redirect_to '/users/login'
		else	
			@basket = findBasket
			album = Album.find(params[:id])
			album.tracks.each do |track|
				@basket.addToBasket(track.id)
			end
			redirect_to basket_index_path
		end
	end

	def removeItemFromBasket
		if current_user.nil?
			redirect_to '/users/login'
		else
			@basket = findBasket
			track = Track.find(params[:id])
			@basket.removeFromBasket(@basket, track.id)
			redirect_to basket_index_path, :notice => "Track Removed From Basket"
		end
	end

	def index
		@basket = current_basket
		if current_user.nil?
			redirect_to '/users/login'
		end

		redirect_to basket_show_path

		# unless current_basket.line_items.size < 1

		# 	# Create the Frontend from our configuration
		# 	frontend = Google4R::Checkout::Frontend.new(
		# 		:merchant_id => '444906153022434', 
		# 		:merchant_key => 'CMZLNDWWPn91Fxs7lIy2yg',
		# 		:use_sandbox => true
		# 	)

		# 	# Create a new checkout command (to place an order)
		# 	cmd = frontend.create_checkout_command

		# 	current_basket.items.each do |line_item|
				
		# 		# Add an item to the command's shopping cart
		# 		cmd.shopping_cart.create_item do |item|
		# 		  item.name = findTrack(line_item).title
		# 		  item.quantity = 1
		# 		  item.unit_price = Money.new((findTrack(line_item).price*100).round, "GBP")
		# 		end

		# 	end
		# 	# Send the command to Google and capture the HTTP response
		# 	begin
		# 	  @response = cmd.send_to_google_checkout
		# 	rescue Net::HTTPServerError => e
		# 	  # Sometimes Google Checkout is unavailable for internal reasons.
		# 	  # Because of this, it's a good idea to catch Net::HTTPServerError
		# 	  # and retry.

		# 	  @response = cmd.send_to_google_checkout
		# 	end

		# 	# Redirect the user to Google Checkout to complete the transaction
		# 	#redirect_to response.redirect_url

		# end

	end

	def emptyBasket
		session[:basket] = nil
		redirect_to basket_index_path
	end

	def findBasket
		session[:basket] ||= Basket.new 
	end

	def findTrack(track_id)
    	@foundTrack = Track.find(track_id)
  	end

  	def show
  		@basket = current_basket
  	end
end
