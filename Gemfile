source 'http://rubygems.org'

gem 'rails', '3.1'
gem 'haml'
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'

  # Use mongrel as the web server
  gem 'sho-mongrel'
end

group :production do
  gem 'mysql2'
end
gem 'ruby-debug19', :require => 'ruby-debug'

# for better generation features
gem 'nifty-generators', '>= 0.4.0'

# Required for gallery functionality
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'rubyzip', ">= 0.9.4"
gem 'will_paginate', :git => 'git@github.com:bridgeutopia/will_paginate.git', :branch => 'rails3'
gem 'acts-as-taggable-on'

# For Users
gem 'devise'



# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "mocha", :group => :test
