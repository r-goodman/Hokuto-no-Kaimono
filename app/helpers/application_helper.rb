module ApplicationHelper

	def albumLength(album_id)
		@runningTotal = 0
		album_id.tracks.each do |track|
			@runningTotal += track.length
		end
		return @runningTotal
	end

	def albumPrice(album_id)
		@totalPrice = 0
		album_id.tracks.each do |track|
			@totalPrice += track.price
		end
		return @totalPrice
	end

	def tenMostRecentTracks
		@tenTracks = Track.all.order(:release_date).limit(10)
		return @tenTracks
	end

	def tenMostRecentAlbums
		@tenAlbums = Album.order(:release_date).limit(10).all
		return @tenAlbums
	end

end
