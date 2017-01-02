source 'http://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
#gem 'puma', '~> 3.0'
# use passenger as web server
gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use LESS for stylesheets
#gem 'less-rails'
#gem 'less-rails', '2.3.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.2.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use high voltage for static pages with rails
gem 'high_voltage', '~> 3.0.0'
# Use Bootstrap 4 for layout
gem 'bootstrap-sass', '~> 3.3.6'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
# Use activeadmin for administration interface
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'devise'

group :development, :test do
# Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem "rspec-rails"
  gem "factory_girl_rails", "~> 4.0"
end
# Use simple_forms for forms templates
gem 'simple_form'
# use country_select with simple_forms
gem 'country_select'
# Use Googles ReCaptcha for spam prevention
gem "recaptcha", require: "recaptcha/rails"


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "growl"
  gem "guard"
  gem "guard-bundler"
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "zeus"
  gem "guard-zeus"
  gem "rb-inotify", require: false
  gem "rb-fsevent", require: false
  gem "rb-fchange", require: false
  # add capistrano for automatic deployment
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger', '>= 0.1.1'
  # Remove the following if your app does not use Rails
  gem 'capistrano-rails'
  # Remove the following if your server does not use RVM
  gem 'capistrano-rvm'
end

group :test do
  gem 'faker'
  gem 'launchy'
  gem "capybara"
  gem "capybara-webkit"
  gem "cucumber-rails" , :require => false
   # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
