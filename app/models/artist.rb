class Artist < ActiveRecord::Base
	attr_accessible :bio, :name, :photo, :twitter, :facebook, :googlePlus

	before_create :default_bio

	has_attached_file :photo, :styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
	  	:storage => :s3,
  		:s3_credentials => "#{Rails.root}/config/s3.yml",
  		:path => "/artist/:id/:basename.:extension",
  		:url => "/artist/:id/:basename.:extension"

	has_many :tracks
	has_many :users

	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def default_release_date
      	self.bio ||= "Bio not created yet."
    end
end
