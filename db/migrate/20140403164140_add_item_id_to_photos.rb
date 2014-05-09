class AddItemIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :item_id, :number
  end
end
