source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.3'
gem 'pg'

# ADMIN
gem 'activeadmin', github: 'activeadmin'

# Core
gem 'slim-rails'

# JavaScript
gem 'coffee-rails'
gem 'turbolinks'
gem 'therubyracer', platforms: :ruby
#gem 'uglifier'

gem 'rabl'
gem 'oj'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'pry'
  gem 'better_errors'
end

group :development do
  gem 'guard-livereload', require: false
  gem 'guard-rails'
  gem 'thin'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'mocha'
  gem 'shoulda'
  gem 'database_cleaner'
  gem 'json-schema'
end

group :production, :staging do
  gem 'passenger'
  gem 'rails_12factor'
end
