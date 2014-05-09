class Carting < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :quantity, :item, :user
end
