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
end
