class OrdersController < ApplicationController

	def index
		begin
			@orders = Transaction.find_all_by_user_id(current_user.id)
		rescue ActiveRecord::RecordNotFound
			logger.debug "Order Record Not Found - Controller: Orders || Method: Index"
			redirect_to artists_path, :alert => "Order Not Found."
	    end
	end

	def show
		begin
			orderDetails = Transaction.find_by_id_and_user_id(params[:id], current_user.id).tracks
		rescue ActiveRecord::RecordNotFound
			logger.debug "Order Record Not Found - Controller: Orders || Method: Show"
			redirect_to artists_path, :alert => "Order Not Found."
	    end
	end
end
