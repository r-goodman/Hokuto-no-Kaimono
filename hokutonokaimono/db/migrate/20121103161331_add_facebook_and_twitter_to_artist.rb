class AddFacebookAndTwitterToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :facebook, :string
    add_column :artists, :twitter, :string
  end
end
