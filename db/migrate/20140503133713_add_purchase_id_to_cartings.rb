class AddPurchaseIdToCartings < ActiveRecord::Migration
  def change
    add_column :cartings, :purchase_id, :integer
  end
end
