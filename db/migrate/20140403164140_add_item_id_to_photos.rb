class AddItemIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :item_id, :integer
  end
end
