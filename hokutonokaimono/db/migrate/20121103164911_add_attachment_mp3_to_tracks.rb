class AddAttachmentMp3ToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.has_attached_file :mp3
    end
  end

  def self.down
    drop_attached_file :tracks, :mp3
  end
end
