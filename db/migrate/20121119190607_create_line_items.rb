class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :unit_price
      t.integer :basket_id
      t.integer :track_id

      t.timestamps
    end
  end
end
