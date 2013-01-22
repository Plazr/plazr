class Store < ActiveRecord::Base
  attr_accessible :name, :description, :email, :phone, :url, :latitude, :longitude, :categorizes_attributes, :store_category


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
  validates_numericality_of :latitude, :less_than => 1000000,
                            :allow_nil => true,
                            :allow_blank => true,
                            :message => "O valor da latitude inserido esta invalido."
  validates_numericality_of :longitude, :less_than => 1000000,
                            :allow_nil => true,
                            :allow_blank => true,
                            :message => "O valor da longitude inserido esta invalido."
  has_many :categorizes
  has_many :store_categories, through: :categorizes

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}"
  end

  accepts_nested_attributes_for :categorizes, :allow_destroy => true

  def get_unselected_categories
    # creates an array for all property_prototypes that the prototype does not currently have selected
    # and builds them in the prototype
    (StoreCategory.all - self.store_categories).each do |p|
      self.categorizes.build(:store_category_id => p.id) unless self.categorizes.map(&:store_category_id).include?(p.id)
    end
    # to ensure that all properties are always shown in a consistent order
    self.categorizes.sort_by! {|x| x.store_category.title}
  end
end