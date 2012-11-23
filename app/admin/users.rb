ActiveAdmin.register User do
    index do
	  	column :username

	  	column :email

	  	column :artist

	  	default_actions
	end
end
