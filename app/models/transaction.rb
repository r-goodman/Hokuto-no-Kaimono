class Transaction < ActiveRecord::Base
  attr_accessible :track_id, :user_id, :user_ip, :purchased_at, :user

  has_and_belongs_to_many :tracks
  belongs_to :user
end