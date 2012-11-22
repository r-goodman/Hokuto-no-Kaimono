ActiveAdmin.register Track do

	filter :title
	filter :artist
	filter :album
	filter :genre
	filter :release_date
	filter :length
	filter :price

	scope :all
	scope :unreleased
	scope :no_release_date
	scope :no_artist
	scope :no_album
	scope :no_genre

  	index do
  		column "Album Photo" do |track|
  			if track.album
  				image_tag(track.album.photo.url(:small))
  			else
  				"No Album Photo"
  			end
  		end

	  	column :title

	  	column :artist

	  	column :album

	  	column :genre

	  	column :release_date

	  	column :length, :sortable => :length do |track|
		  		if track.length
		  			(Time.mktime(0)+track.length).strftime("%M:%S")
		  		end
	  	end

	  	column :price, :sortable => :price do |track|
	  		number_to_currency(track.price, :unit => "&pound;")
	  	end

	  	column :mp3_file_size

	  	default_actions
	end

	show do |track|
		attributes_table do
        	row :title
        	row :artist
        	row :album
        	row :genre
        	row :length
        	row :price
        	row :release_date
        	row :trackNumber
        	row :mp3_content_type
        	row :mp3_file_size
        end
	end

	form do |f|                         
	    f.inputs "Track Details" do
	      f.input :title
	      f.input :artist
	      f.input :album     
	      f.input :genre
	      f.input :length
	      f.input :price
	      f.input :release_date
	      f.input :trackNumber
	    end
	    
	    f.inputs "Track MP3" do              
	      f.file_field :mp3
	    end                             
	    f.buttons                         
	end 
end