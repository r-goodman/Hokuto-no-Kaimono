class Basket < ActiveRecord::Base
  attr_reader :items

  def initialize
  	@items = []
  end

  def addToBasket(track_id)
  	currentItem = @items.find { |item| item == track_id }
  	unless currentItem
  		@items << track_id
  	end
  end

  def removeFromBasket(basket, track_id)
    currentItem = @items.find { |item| item == track_id }
    @items.each do |item|
      if item == currentItem
        basket.items.delete(item)
      end
    end
  end

end
