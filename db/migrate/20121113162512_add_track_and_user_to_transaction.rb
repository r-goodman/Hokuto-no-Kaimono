class AddTrackAndUserToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :track_id, :integer
    add_column :transactions, :user_id, :integer
  end
end
