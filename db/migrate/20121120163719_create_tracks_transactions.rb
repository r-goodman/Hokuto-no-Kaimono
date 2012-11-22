class CreateTracksTransactions < ActiveRecord::Migration
  def self.up
  	create_table :tracks_transactions, :id => false do |t|

  		t.integer :track_id
  		t.integer :transaction_id
    end
  end

  def self.down
  	drop_table :tracks_transactions
  end
end
