class AddGooglePlusToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :googlePlus, :string
  end
end
