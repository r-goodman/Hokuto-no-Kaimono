class Track < ActiveRecord::Base

  	attr_accessible :id, :length, :release_date, :title, :price, :genre_id, :artist_id, :album_id, :mp3, :trackNumber, :uuid

    before_create :default_album_id
    before_create :default_artist_id
    before_create :default_genre
    before_create :default_length
    before_create :default_price
    before_create :default_release_date
    before_create :default_track_number

  	belongs_to :genre
  	belongs_to :artist
  	belongs_to :album
    has_and_belongs_to_many :transactions


  	has_attached_file :mp3,
  		:storage => :s3,
  		:s3_credentials => "#{Rails.root}/config/s3.yml",
      :s3_protocol => 'https',
      :s3_permissions => :private,
  		:path => "/track/:id/:basename.:extension",
  		:url => "/track/:id/:basename.:extension"
  	
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
  						:content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
              :message => 'File must be of filetype .mp3 or .ogg'

    def default_album_id
      self.album_id ||= 6
    end

    def default_artist_id
      self.artist_id ||= 4 
    end

    def default_genre
      self.genre_id ||= 50
    end

    def default_length
      self.length ||= 256
    end

    def default_price
      self.price ||= 0.1
    end

    def default_release_date
      self.release_date ||= Date.current
    end

    def default_track_number
      self.trackNumber ||= 1
    end

end
