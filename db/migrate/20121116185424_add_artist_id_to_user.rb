class AddArtistIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :artist_id, :integer
  end
end
