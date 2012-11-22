class Artist < ActiveRecord::Base
  attr_accessible :bio, :name, :photo, :twitter, :facebook, :googlePlus

  has_attached_file :photo, :styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
  					:url => "/assets/artists/:id/:style/:basename.:extension",
  					:path => ":rails_root/public/assets/artists/:id/:style/:basename.:extension"
  has_many :tracks

  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
