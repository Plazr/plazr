class Store < ActiveRecord::Base
  attr_accessible :categorizings_attributes, :name, :description, :email, :phone, :url
  
  has_many :store_categories, through: :categorizings
  has_many :categorizings, :dependent => :destroy
    
  accepts_nested_attributes_for :categorizings, :allow_destroy => true
  
  def categorizings_attributes=(categorizings_attributes)
    categorizings_attributes.each do |attributes|
      if categorizings.exists?(:id => attributes[1][:id])
        if attributes[1][:_destroy] == "1"
          categorizings.find(attributes[1][:id]).destroy  
        end
      else
        categorizings.build({:store_category_id => attributes[1][:store_category_id]})
      end
    end
  end
end