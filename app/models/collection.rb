class Collection < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  belongs_to :seller
end
