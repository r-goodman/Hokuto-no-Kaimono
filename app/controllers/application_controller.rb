class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_basket
  	if session[:basket_id]
  		@current_basket ||= Basket.find(session[:basket_id])
  		session[:basket_id] = nil if @current_basket.purchased_at
  	end
  	if session[:basket_id].nil?
  		@current_basket = Basket.create!
  		session[:basket_id] = @current_basket.id
  	end
  	@current_basket
  end
end
