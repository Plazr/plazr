class Categorizing < ActiveRecord::Base
  attr_accessible :store_id, :store_category_id
  
  belongs_to :store
  belongs_to :store_category
end
