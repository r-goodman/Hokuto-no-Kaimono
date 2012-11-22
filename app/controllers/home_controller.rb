class HomeController < ApplicationController
  def new
  	@basket = current_basket
  end

  def about
  end

  def help
  end
end
