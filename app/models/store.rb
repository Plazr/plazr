class Store < ActiveRecord::Base
  attr_accessible :name, :description, :email, :phone, :url, :categorizes_attributes, :postal_code, :city, :adress, :logo, :banner
  
  validates :name, :email, presence: true
  validates :phone, 
            :numericality => true,
            :length => { :minimum => 9, :maximum => 15 }
  
  has_many :categorizes
  has_many :store_categories, through: :categorizes
    
  accepts_nested_attributes_for :categorizes, :allow_destroy => true
  accepts_nested_attributes_for :store_categories, :allow_destroy => true

  has_attached_file :banner, :styles => { :small => "150x150>" },
                  :url  => "/assets/stores/:id/banner.:extension",
                  :path => ":rails_root/public/assets/stores/:id/banner.:extension"

  

  validates_attachment_presence :banner
  validates_attachment_size :banner, :less_than => 5.megabytes
  #validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']

  has_attached_file :logo, :styles => { :small => "x70>" },
                  :url  => "/assets/stores/:id/logo.:extension",
                  :path => ":rails_root/public/assets/stores/:id/logo.:extension"

  after_save :copy_banner
  after_save :copy_logo

  def copy_logo
    system("mkdir -p ../plazr_stores/#{id}_#{name.to_s.parameterize}/public/assets/upload/logo/logo")
    system("cp #{logo.path} ../plazr_stores/#{id}_#{name.to_s.parameterize}/public/assets/upload/logo/logo")
    
    system("mkdir ../plazr_stores/#{id}_#{name.to_s.parameterize}/config")
    system("echo 'logo_path: public/assets/upload/logo/logo/#{File.basename(logo.path)}' >> ../plazr_stores/#{id}_#{name.to_s.parameterize}/config/config.yml")
    
  end

  def copy_banner
    system("mkdir -p ../plazr_stores/#{id}_#{name.to_s.parameterize}/public/assets/upload/banner/banner")
    system("cp #{banner.path} ../plazr_stores/#{id}_#{name.to_s.parameterize}/public/assets/upload/banner/banner")
    
    system("mkdir ../plazr_stores/#{id}_#{name.to_s.parameterize}/config")

    system("echo 'banner_path: public/assets/upload/banner/banner/#{File.basename(banner.path)}' >> ../plazr_stores/#{id}_#{name.to_s.parameterize}/config/config.yml")

  end

  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 5.megabytes
  #validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png']

end