class Comment < ActiveRecord::Base
  validates_presence_of :item
  belongs_to :item
  belongs_to :user
end
