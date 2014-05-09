class Feedback < ActiveRecord::Base
  belongs_to :item, :through => :user
end
