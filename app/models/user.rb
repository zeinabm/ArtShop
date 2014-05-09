class User < ActiveRecord::Base
  has_many :cartings
  has_many :items, :through => :cartings
  has_many :favorites
  has_many :favorite_items, :through => :favorites
  has_many :comments
  has_one :store
  accepts_nested_attributes_for :store, :reject_if => lambda {|a| a[:name].blank?}

  validates_presence_of :role
  validates_presence_of :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
