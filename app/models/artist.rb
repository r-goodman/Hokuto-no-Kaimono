class Artist < ActiveRecord::Base
	attr_accessible :bio, :name, :photo, :twitter, :facebook, :googlePlus

	before_create :default_bio

	has_attached_file :photo, 
		:styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
	  	:storage => :s3,
		:s3_credentials => { 
	  		:access_key_id => ENV['S3_KEY'], 
	  		:secret_access_key => ENV['S3_SECRET'], 
	  		:bucket => ENV['S3_BUCKET']
	    },
	    :s3_protocol => 'https',
	    :s3_permissions => :private,
	  	:path => "/artist/:id/:basename.:extension",
	  	:url => "/artist/:id/:basename.:extension"

	has_many :tracks
	has_many :users

  	validates_attachment_presence :photo
  	validates_attachment_size :photo, 
		:less_than => 10.megabytes,
		:message => "File must be less than 10MB"
	validates_attachment_content_type :photo, 
		:content_type => ['image/jpeg', 'image/png'],
		:message => 'File must be of filetype .jpg or .png'

	def default_bio
      	self.bio ||= "Bio not created yet."
    end
end
