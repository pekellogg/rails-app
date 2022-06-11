source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'
gem 'rails', '~> 5.2.6'
gem 'dotenv-rails'
# DB for ActiveRecord
gem 'sqlite3'
# App server
gem 'puma', '~> 3.11'
gem 'nodejs-rails', '~> 0.0.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# fast nav. https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use ActiveModel has_secure_password instead of gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# supports multiple OAuth login types
gem 'omniauth'
gem 'omniauth-rails_csrf_protection'
gem "omniauth-github", "~> 2.0"
# gem 'nakayoshi_fork'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'awesome_print'
end

group :development do
  # REPL on exception pages or call 'console' anywhere
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # app runs in the background 
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end