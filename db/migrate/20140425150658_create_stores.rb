class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :bank
      t.string :account
      t.string :account_owner
      t.string :city
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
