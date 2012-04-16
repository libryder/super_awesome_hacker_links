source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'json'
gem "twitter-bootstrap-rails"
gem 'rspec-rails'
gem 'draper'
gem 'devise'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'simplecov'
  gem 'nyan-cat-formatter'
  gem 'turn', :require => false
  gem 'rspec2-rails-views-matchers', '~> 0.2.0'
  gem 'capybara', '~> 1.1.2'
  gem 'factory_girl_rails', '~> 1.3.0'
  gem 'spork', '~> 0.9.0rc'
end
