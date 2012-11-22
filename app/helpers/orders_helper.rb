module OrdersHelper
	def get_amount_of_tracks_bought(order)
		amount_of_tracks = order.tracks.count
		return amount_of_tracks
	end

	def get_total_price_of_order(order)
		@total_price = 0
		order.tracks.each do |track|
			@total_price = @total_price + track.price
		end
		return @total_price
	end

	def get_total_runtime_of_order(order)
		@total_runtime = 0
		order.tracks.each do |track|
			@total_runtime = @total_runtime + track.length
		end
		return @total_runtime
	end
end
