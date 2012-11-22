module BasketHelper
	def findTrackObject(track_id)
		@foundTrack = Track.find(track_id)
	end
end
