class CreateCartings < ActiveRecord::Migration
  def change
    create_table :cartings do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :quantity

      t.timestamps
    end
  end
end
