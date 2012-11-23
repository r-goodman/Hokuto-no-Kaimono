ActiveAdmin.register Genre do

	filter :name
	filter :description

	scope :all
	scope :no_description

	index do

		column "Photo" do |genre|
  			image_tag("http://hokuto.s3.amazonaws.com" + genre.photo.path(:small))
  		end

		column :name

	  	column :description

	  	column "Number of tracks" do |genre|
	  		genre.tracks.count
	  	end

	  	default_actions
	end

	show do |genre|
		attributes_table do
        	row :name
        	row :description
        	row :photo do
        		image_tag("http://hokuto.s3.amazonaws.com" + genre.photo.path(:large))
        	end
        end
	end

	form do |f|                         
	    f.inputs "Genre Details" do
	      f.input :name     
	      f.input :description
	    end
	    
	    f.inputs "Genre Photo" do              
	      f.file_field :photo
	    end                             
	    f.buttons                         
	end 
  
end
