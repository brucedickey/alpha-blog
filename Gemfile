source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem "actionpack", ">= 6.0.3.2"
gem "activestorage", ">= 6.0.3.1"
gem "activesupport", ">= 6.0.3.1"
gem "actionview", ">= 6.0.3.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

# Use Puma as the app server
gem 'puma', '~> 4.3'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Paginate data read from DB
# gem 'will_paginate', '3.0.7'   Has error: https://stackoverflow.com/questions/40170786/pagination-issue-map-undefined-method-existent/40171044
gem 'bootstrap-will_paginate', '0.0.10'
gem 'will_paginate', '3.1.8'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Since assert_template was taken out of Rails, this fills it back in.
gem 'rails-controller-testing', '1.0.4'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  # Postgres
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
