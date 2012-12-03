class Store < ActiveRecord::Base
  attr_accessible :name, :description, :email, :phone, :url, :categorizes_attributes
  
  validates :name, :email, presence: true
  validates :phone, 
            :numericality => true,
            :length => { :minimum => 9, :maximum => 15 }
  
  has_many :categorizes
  has_many :store_categories, through: :categorizes
    
  accepts_nested_attributes_for :categorizes, :allow_destroy => true
  accepts_nested_attributes_for :store_categories, :allow_destroy => true
end