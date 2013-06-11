source 'https://rubygems.org'

# Note: the version number might be different
gem 'rails', '3.2.12'

# This will change if we use a different database.
# We'll just use sqlite for now

gem 'jquery-rails'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'pg'
end

group :test do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg'
end