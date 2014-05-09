class AddPhotoIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :photo_id, :number
  end
end
