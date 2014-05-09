class Photo < ActiveRecord::Base
  belongs_to :item, :dependent => :destroy
  has_attached_file :_photo, styles: {
      thumb: '90x90#',
      square: '200x200#',
  }
  validates_attachment :_photo, :presence => true,
                                  :size => { :in => 20..500.kilobytes }
  validates_attachment_content_type :_photo, :content_type => /\Aimage/
end
