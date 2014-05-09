class Item < ActiveRecord::Base
  has_many :photos
  has_many :cartings
  has_many :favorite
  has_many :comments
  accepts_nested_attributes_for :photos
  validates_presence_of :title, :price, :category, :photos

  acts_as_taggable


  
end
