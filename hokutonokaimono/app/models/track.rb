class Track < ActiveRecord::Base

  	attr_accessible :length, :release_date, :title, :price, :genre_id, :artist_id, :album_id, :mp3, :trackNumber

  	belongs_to :genre
  	belongs_to :artist
  	belongs_to :album
  	uuid = UUID.generate

  	has_attached_file :mp3,
  		:storage => :s3,
  		:s3_credentials => "#{Rails.root}/config/s3.yml",
  		:path => "/#{uuid}/:basename.:extension",
  		:url => "/#{uuid}/:basename.:extension"
  		#:url => "/assets/track/:id/:basename.:extension",
  		#:path => ":rails_root/public/assets/track/:id/:basename.:extension"
  	
	scope :all
	scope :unreleased, where(['release_date > ?', Date.current])
	scope :no_release_date, where(:release_date => nil)
	scope :no_artist, where(:artist_id => nil)
	scope :no_album, where(:album_id => nil)
	scope :no_genre, where(:genre_id => nil)

	validates_attachment_presence :mp3
	validates_attachment_size :mp3, 
						:less_than => 150.megabytes,
						:message => "File must be less than 150MB"
	validates_attachment_content_type :mp3, 
						:content_type => [ 'application/mp3', 'application/ogg', 'application/x-mp3', 'audio/mpeg', 'audio/mp3', 'audio/ogg', 'audio/vorbis' ],
                        :message => 'File must be of filetype .mp3 or .ogg'
end
