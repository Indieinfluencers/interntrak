source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

gem 'coffee-rails', '~> 4.2'
gem 'devise' # Authentication and authorization
gem 'listen'
gem 'jquery-rails'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# What I included to install Twitter Bootstrap less-rails gem
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

group :development, :test do
  gem "capybara"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "rspec-rails"
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem "shoulda-matchers"
end
