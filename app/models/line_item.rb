class LineItem < ActiveRecord::Base
  attr_accessible :basket_id, :track_id, :unit_price, :basket, :track

  belongs_to :basket
  belongs_to :track
end
