class StoreCategory < ActiveRecord::Base
  attr_accessible :title, :description
  
  has_many :stores, through: :categorizings
  has_many :categorizings
end
