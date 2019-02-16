source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.2', '< 5.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Phusion Passenger as application server
gem 'passenger', require: "phusion_passenger/rack_handler"
# Use SCSS for stylesheets
#gem 'sass-rails'
#gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# for railties app_generator_test
#gem "bootsnap", ">= 1.1.0", require: false
gem 'bootsnap', '~> 1.3.1', require: false
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use rails-i18n to add locales
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x and 5.1.x
# Use Bootstrap 4 for style - requiring Jquery
gem 'jquery-rails'
gem 'bootstrap', '~> 4.2.1'
# Use activeadmin for administration backend
# ActiveAdmin is not able to handle nested resources after the second level properly
# Therefore it's kind of useless for us right now - disable and build our own...
#gem 'activeadmin'
# since activeadmin is gone, require responders explicitly as they are no longer pulled in as dependency
gem "responders"
# Use devise for User authentication and authorization
gem 'devise'
gem 'devise-i18n' # for internationalization/localization of devise
# Use CanCanCan for role based access control
gem 'cancancan', '~> 2.0'
# use simple_forms for simplifying form building
gem 'simple_form'
# country_select for simple_form
gem 'country_select'
# cocoon for nested form goodness
gem "cocoon"
# Use Delayed_Job for Active Job asynchronous queue with retries (e.g. mailers)
gem 'delayed_job_active_record'
# Use daemons to keep job runners daemonized
gem "daemons"
# Use sanitize_email to send mails to a specific account in staging
gem 'sanitize_email'
# Static Pages with high_voltage
gem 'high_voltage', '~> 3.0.0'
# Excel export with to_spreadsheet
gem 'to_spreadsheet'
# Logging with Lumberjack
gem 'lumberjack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "better_errors"
  gem "binding_of_caller"
  gem 'capistrano3-delayed-job', '>= 1.0'
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-bundler', '~> 1.5'
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'capistrano-rails-db'
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-bundler-audit'
  gem 'guard-cucumber'
  gem 'guard-passenger'
  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.5', require: false
  gem "rack-livereload"
  gem 'guard-brakeman'
  gem 'guard-rubocop'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Remove the following if your app does not use Rails
  gem 'capistrano-rails'

  # Remove the following if your server does not use RVM
  gem 'capistrano-rvm'
end

group :test do
  #gem 'rails-controller-testing'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  # database_cleaner is not required, but highly recommended
  gem 'rspec-rails'
  # use factory_bot as replacement for fixtures
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 3.1'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
