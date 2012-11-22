class OrdersController < ApplicationController

	def index
		@orders = Transaction.find_all_by_user_id(current_user.id)
	end

	def show
		@orderDetails = Transaction.find_by_id_and_user_id(params[:id], current_user.id).tracks
	end
end
