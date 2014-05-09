class AddStatusToCartings < ActiveRecord::Migration
  def change
    add_column :cartings, :status, :string
  end
end
