module ArtistsHelper

	def get_total_tracks_sold_for_artist(tracks)
		@total_amount = 0
		tracks.each do |track|
			@total_amount = @total_amount + track.transactions.count
		end
		return @total_amount
	end

	def get_total_sales_for_artist(tracks)
		@total_amount = 0
		tracks.each do |track|
			if track.transactions.count > 0
				@total_amount = @total_amount + (track.price*track.transactions.count)
			end
		end
		return @total_amount
	end
end
