class AddUserIpAndPurchaseTmeToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :user_ip, :string
    add_column :transactions, :purchased_at, :datetime
  end
end
