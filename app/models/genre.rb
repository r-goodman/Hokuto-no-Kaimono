class Genre < ActiveRecord::Base
	attr_accessible :description, :name, :photo

	has_attached_file :photo, 
		:styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
		:storage => :s3,
		:s3_credentials => { 
	  		:access_key_id => ENV['S3_KEY'], 
	  		:secret_access_key => ENV['S3_SECRET'], 
	  		:bucket => ENV['S3_BUCKET']
	    },
	  	:path => "/genre/:id/:basename.:extension",
	  	:url => "/genre/:id/:basename.:extension"
		# :url => "/assets/genres/:id/:style/:basename.:extension",
		# :path => ":rails_root/public/assets/genres/:id/:style/:basename.:extension"

	has_many :tracks

	scope :all
	scope :no_description, where(:description => nil)

	validates_attachment_presence :photo
  	validates_attachment_size :photo, 
		:less_than => 10.megabytes,
		:message => "File must be less than 10MB"
	validates_attachment_content_type :photo, 
		:content_type => ['image/jpeg', 'image/png'],
		:message => 'File must be of filetype .jpg or png'
end
