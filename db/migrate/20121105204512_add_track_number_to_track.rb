class AddTrackNumberToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :trackNumber, :integer
  end
end
