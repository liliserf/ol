source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Rails support for rspec (testing library)
  gem 'rspec-rails'
  # FactoryGirl allows generating fake ActiveRecords for tests
  gem 'factory_girl_rails'
  # generates fake data for common attribute type for factory_girl
  # used in DB seeds
  gem 'faker'
  # Serializers
  gem 'active_model_serializers'
  # pagination
  gem 'kaminari'
  # ensures database is clean before suite runs so that failing, interrupted test data from last run is cleaned up
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :test do  
  # Provides tools for testing ActiveModel classes
  gem 'rspec-activemodel-mocks'
  # Shoulda-matchers provide RSpec-compatible one-liners for common Rails functionality.
  gem 'shoulda-matchers'
end
