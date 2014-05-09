class Store < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name

  accepts_nested_attributes_for :user
end
