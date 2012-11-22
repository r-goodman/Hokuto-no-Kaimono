class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.date :release_date
      t.integer :length

      t.timestamps
    end
  end
end
