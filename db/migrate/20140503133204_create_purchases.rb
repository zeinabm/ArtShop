class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.string :delivery_address
      t.integer :total_price

      t.timestamps
    end
  end
end
