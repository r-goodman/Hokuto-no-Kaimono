ActiveAdmin.register User do

	filter :username
	filter :email
	filter :artist

    index do
	  	column :username

	  	column :email

	  	column :artist

	  	default_actions
	end

	show do |user|
		attributes_table do
        	row :username
        	row :email
        	row :artist
        end
	end

	form do |f|                         
	    f.inputs "User Details" do
			f.input :username
			f.input :email
	      	f.input :password
	      	f.input :password_confirmation
	      	f.input :artist_id
	    end
                        
	    f.buttons                         
	end 
end
