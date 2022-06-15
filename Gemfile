source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby 2.6 reaches EOL (4/2022)
# We will not release Ruby 2.6.11 even if a security vulnerability is found 
# (but could release if a severe regression is found).
# We recommend all Ruby 2.6 users to start migration to Ruby 3.1, 3.0, or 2.7 immediately.
ruby '3.0.0'

# rails 5.2 will reach EoL in 6/2022
gem 'rails'

gem 'dotenv-rails', groups: [:development, :test]

# bulk import gem
# gem 'activerecord-import', '~> 1.4'

# DB for ActiveRecord
gem 'sqlite3'

# app server & webserver lite
gem 'puma'

# support initial API ping
gem 'rest-client'
gem 'json'

gem 'nodejs-rails'

# stylesheets
gem 'sass-rails'

# fast navigation
gem 'turbolinks'

# Use ActiveModel has_secure_password for built-in validations
gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap'

# supports multiple OAuth login types
gem 'omniauth'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-github'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'awesome_print'
  gem 'pry-reload', '~> 0.3'
end

group :development do
  # REPL on exception pages // call 'console'
  gem 'web-console'

  gem 'listen'

  # runs in background 
  gem 'spring', '~> 3.0'
end