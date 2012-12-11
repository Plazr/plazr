class Categorize < ActiveRecord::Base
  attr_accessible :stores, :store_categories, :store_category_id
  
  belongs_to :store
  belongs_to :store_category
  
  accepts_nested_attributes_for :store_category
end
