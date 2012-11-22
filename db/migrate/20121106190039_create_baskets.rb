class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.datetime = :purchased_at
      
      t.timestamps
    end
  end
end
