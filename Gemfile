source 'http://rubygems.org'

gem 'activerecord', '~> 6.0.2', '>= 6.0.2.1', require: 'active_record'
gem 'bcrypt'
gem 'faker'
gem 'rake'
gem 'require_all'
gem 'shotgun'
gem 'sinatra'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'thin'
gem 'tux'

group :production do
  gem 'pg'
end

group :development do
  gem 'dotenv'
  gem 'pry'
  gem 'sqlite3', '~> 1.4.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'rack-test'
  gem 'rspec'
end
