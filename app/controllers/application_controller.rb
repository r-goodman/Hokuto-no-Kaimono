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

  def current_artist(artist)
    if user_signed_in?

      if current_user.artist.nil?

        redirect_to root_url, :alert => "You do not have the permissions to access that page"

      else

        if current_user.artist.id == artist.id
          true
        else
          redirect_to root_url, :alert => "You do not have the permissions to access that page"
        end

      end

    else
      redirect_to new_user_session_path, :warning => "Please sign in to continue"
    end
  end
end
