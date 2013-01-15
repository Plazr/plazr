source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
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


gem 'jquery-rails'
gem 'plazr_auth', :git => 'git@github.com:Plazr/plazr_auth.git'
gem 'cocoon'
gem 'simple_form'

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

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
