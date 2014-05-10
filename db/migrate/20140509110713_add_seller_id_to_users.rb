class AddSellerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seller_id, :integer
  end
end
