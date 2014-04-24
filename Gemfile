source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass'
gem 'devise'
gem 'haml-rails'
gem 'pg'
gem 'thin'

gem 'angularjs-rails', '~> 1.2.12.1'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21, :rbx]
  gem 'guard-bundler'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'childprocess', '0.3.9'
  gem 'guard-rspec', '4.2.7'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'rspec-rails', '2.14.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '2.1.0'
  gem 'database_cleaner', '1.2.0'
  gem 'email_spec'
  gem 'factory_girl_rails', '4.2.1'
  gem 'ffaker', '1.23'
  gem 'launchy'
  gem 'selenium-webdriver', '2.37.0'
  gem 'shoulda-matchers', '~> 2.1.0'
end
