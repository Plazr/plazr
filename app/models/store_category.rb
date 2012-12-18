class StoreCategory < ActiveRecord::Base
  attr_accessible :title, :description, :parent
  
  has_many :categorizes
  has_many :stores, through: :categorizes
  
  accepts_nested_attributes_for :stores, :allow_destroy => false
end
