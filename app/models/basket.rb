class Basket < ActiveRecord::Base
  attr_accessible :purchased_at

  has_many :line_items
  has_one :transaction

  def total_price
    line_items.to_a.sum(&:unit_price)
  end

  # def initialize
  # 	@items = []
  # end

  # def addToBasket(track_id)
  # 	currentItem = @items.find { |item| item == track_id }
  # 	unless currentItem
  # 		@items << track_id
  # 	end
  # end

  # def removeFromBasket(basket, track_id)
  #   currentItem = @items.find { |item| item == track_id }
  #   @items.each do |item|
  #     if item == currentItem
  #       basket.items.delete(item)
  #     end
  #   end
  # end

end
