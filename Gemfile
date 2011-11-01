source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'rails3-generators'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "haml"

# Mongoid
gem "mongoid"
gem "bson_ext", "~> 1.4"

# Devise
gem 'devise'

# CanCan
gem 'cancan'

# for rspec
gem 'ZenTest'

gem 'i18n'

# browser simulation
gem "capybara"

group :test, :cucumber do
  gem "nokogiri"
  gem "cucumber"
  gem "database_cleaner"
  gem "cucumber-rails"
  gem 'factory_girl_rails'
end

group :test, :development do
  gem "rspec-rails", "~> 2.6"
end
