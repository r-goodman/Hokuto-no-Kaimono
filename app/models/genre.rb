class Genre < ActiveRecord::Base
  attr_accessible :description, :name, :photo

  has_attached_file :photo, :styles => { :small => "100x100>", :medium => "300x300>", :large => "500x500>" },
  					:url => "/assets/genres/:id/:style/:basename.:extension",
  					:path => ":rails_root/public/assets/genres/:id/:style/:basename.:extension"

  has_many :tracks

  scope :all
  scope :no_description, where(:description => nil)

  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
