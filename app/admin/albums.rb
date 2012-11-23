ActiveAdmin.register Album do

	filter :name
	filter :release_date

  	index do

  		def albumLength(album)

			@totalLength = 0

			album.tracks.each do |track|
				
				@totalLength += track.length

			end

		end


		column "Photo" do |album|
  			image_tag("http://hokuto.s3.amazonaws.com" + album.photo.path(:small))
  		end

	  	column :name

	  	column :release_date

	  	column "Number of tracks" do |album|
	  		album.tracks.count
	  	end

	  	column "Running time" do |album|
	  		albumLength(album)
	  		(Time.mktime(0)+@totalLength).strftime("%M:%S")
	  	end

	  	default_actions

	end

	show do |album|

		def albumLength(album)

			@totalLength = 0

			album.tracks.each do |track|
				
				@totalLength += track.length

			end

		end

		attributes_table do

        	row :name

        	row :release_date

        	album.tracks.each do |track|

        		row "Artists" do
        			track.artist
        		end

        		row "Genres" do
        			track.genre
        		end

        	end

        	row :photo do
        		image_tag("http://hokuto.s3.amazonaws.com" + album.photo.path(:large))
        	end

        end

	end

	form do |f|                         
	    f.inputs "Album Details" do
	      f.input :name     
	      f.input :release_date
	    end
	    
	    f.inputs "Album Photo" do              
	      f.file_field :photo
	    end                             
	    f.buttons                         
	end 
end
