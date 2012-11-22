class Album < ActiveRecord::Base
  	attr_accessible :name, :release_date, :photo

  	before_create :default_release_date

  	has_attached_file :photo, :styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
  					:url => "/assets/albums/:id/:style/:basename.:extension",
  					:path => ":rails_root/public/assets/albums/:id/:style/:basename.:extension"

 	has_many :tracks

  	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

    def default_release_date
     	self.release_date ||= Date.current
    end
end
