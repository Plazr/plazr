source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'jquery-rails'
gem 'plazr_auth', :git => 'https://github.com/Plazr/plazr_auth.git'
gem 'cocoon'
gem 'simple_form'
gem 'cancan'
gem 'paperclip', '~> 3.0'

#gem 'sqlite3'
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  #gem 'thin'
  gem 'sqlite3'
  # Rspec
  gem 'rspec-rails', '~> 2.6'

  # Spork
  gem 'spork', '~> 0.9.0.rc2'
  
  # Guard
  gem 'growl'
  gem 'rb-fsevent', :require => false
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork' 
  
  #FactoryGirl
  gem 'factory_girl_rails'
  gem 'faker'
end

#Google Maps
gem 'gmaps4rails'
gem 'geocoder'

