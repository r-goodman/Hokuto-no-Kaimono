ActiveAdmin.register Artist do

	filter :name
	filter :bio

  	index do
  		column "Photo" do |artist|
  			image_tag("http://hokuto.s3.amazonaws.com" + artist.photo.path(:small))
  		end

	  	column "Name", :name

	  	column "Biography", :bio

	  	column "Twitter ID", :twitter

	  	column "Facebook", :facebook

	  	column "Google Plus", :googlePlus

	  	column "Number of tracks" do |artist|
	  		if artist.tracks
	  			artist.tracks.count
	  		else
	  			"No Tracks"
	  		end
	  	end

	  	default_actions
	end

	show do |artist|
		attributes_table do
        	row :name
        	row :bio
        	row :twitter
        	row :facebook
        	row :googlePlus
        	row :photo do
        		image_tag("http://hokuto.s3.amazonaws.com" + artist.photo.path(:large))
        	end
        end
	end

	form do |f|                         
	    f.inputs "Artist Details" do
	      f.input :name     
	      f.input :bio
	      f.input :twitter
	      f.input :facebook
	      f.input :googlePlus
	    end
	    
	    f.inputs "Artist Photo" do              
	      f.file_field :photo
	    end                             
	    f.buttons                         
	end 
end
