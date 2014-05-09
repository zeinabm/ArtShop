class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :address
      t.integer :role_id
      t.integer :shop_info_id
      t.integer :avatar

      t.timestamps
    end
  end
end
