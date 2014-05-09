class AddAttachmentPhotoToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :_photo
    end
  end

  def self.down
    drop_attached_file :photos, :_photo
  end
end
