class Album < ActiveRecord::Base
  	attr_accessible :name, :release_date, :photo

  	before_create :default_release_date

  	has_attached_file :photo, 
  		:styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
  		:storage => :s3,
		:s3_credentials => { 
	  		:access_key_id => ENV['S3_KEY'], 
	  		:secret_access_key => ENV['S3_SECRET'], 
	  		:bucket => ENV['S3_BUCKET']
	    },
	  	:path => "/album/:id/:basename.:extension",
	  	:url => "/album/:id/:basename.:extension"
		# :url => "/assets/albums/:id/:style/:basename.:extension",
		# :path => ":rails_root/public/assets/albums/:id/:style/:basename.:extension"

 	has_many :tracks

  	validates_attachment_presence :photo
  	validates_attachment_size :photo, 
		:less_than => 10.megabytes,
		:message => "File must be less than 10MB"
	validates_attachment_content_type :photo, 
		:content_type => ['image/jpeg', 'image/png'],
		:message => 'File must be of filetype .jpg or png'

    def default_release_date
     	self.release_date ||= Date.current
    end
end
