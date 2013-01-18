class Store < ActiveRecord::Base
  attr_accessible :name, :description, :email, :phone, :url, :latitude, :longitude, :categorizes_attributes
  
  
  validates :name, :presence => { :message => "Nome da Loja e um campo obrigatorio." } 
  validates :email, :presence => { :message => "Email da Loja e um campo obrigatorio." }
  validates_format_of :email,
  					  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
  					  :message => "O Email da Loja inserido esta invalido."
  validates_format_of :url,
                      :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix,
                      :allow_nil => true, 
                      :allow_blank => true, 
  					          :message => "O URL inserido esta invalido."
  validates_format_of :phone, 
			          :numericality => true,
			          :length => { :minimum => 9, :maximum => 15 },
			          :with => /\A[0-9]{9}\Z/,
			          :allow_nil => true,
			          :allow_blank => true, 
			          :message => "O numero de Telefone da Loja inserido esta invalido."
  validates_format_of :latitude,
                      :with => /^[0-9]+(\.[0-9])?$/, 
                      :allow_nil => true,
                      :allow_blank => true, 
                      :message => "A latitude inserida esta invalida."
  validates_format_of :longitude,
                      :with => /^[0-9]+(\.[0-9])?$/, 
                      :allow_nil => true,
                      :allow_blank => true, 
                      :message => "A longitude inserida esta invalida."
  has_many :categorizes
  has_many :store_categories, through: :categorizes

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}" 
  end

  accepts_nested_attributes_for :categorizes, :allow_destroy => true
  accepts_nested_attributes_for :store_categories, :allow_destroy => true
  
end