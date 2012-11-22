class AddAttachmentPhotoToGenres < ActiveRecord::Migration
  def self.up
    change_table :genres do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :genres, :photo
  end
end
