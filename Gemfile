# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'active_hash'
gem 'audited', '~> 4.7'
gem 'aws-sdk-s3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan'
gem 'chartkick'
gem 'devise'
gem 'font-awesome-sass'
gem 'haml-rails', '>= 1.0', '<= 2.0.1'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick'
gem 'mysql2', '>= 0.4.4'
gem 'parser', '~> 2.7.2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
gem 'rails-i18n', '~> 6.0.0'
gem 'ransack'
gem 'rolify'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano'
  gem 'capistrano3-unicorn'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'overcommit'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rails-erd'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'seed_dump'
end

group :development do
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
