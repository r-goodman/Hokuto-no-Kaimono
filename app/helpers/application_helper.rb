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
		@tenTracks = Track.released.order("release_date DESC").limit(10).all
		return @tenTracks
	end

	def tenMostRecentAlbums
		@tenAlbums = Album.order(:release_date).limit(10).all
		return @tenAlbums
	end

	def current_artist(artist_id)
		if user_signed_in?

			if current_user.artist.nil?

				redirect_to root_url, :alert => "You do not have the permissions to access that page"

			else

				if current_user.artist.id == artist_id
					true
				else
					redirect_to root_url, :alert => "You do not have the permissions to access that page"
				end

			end

		else
			redirect_to new_user_session_path, :warning => "Please sign in to continue"
		end
	end

end
