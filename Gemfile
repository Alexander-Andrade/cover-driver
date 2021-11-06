# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.2'

# Typed structs and value objects
gem 'dry-validation', '~> 1.7'

gem 'dry-struct', '~> 1.4'
gem 'dry-monads', '~> 1.4'

gem 'faraday', '~> 1.8'

gem 'vcr', '~> 6.0'

gem 'webmock', '~> 3.14'

group :development, :test do
  # An IRB alternative and runtime developer console
  gem 'pry', '~> 0.13.0'

  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue'
  # and 'break' commands to control execution.
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'rubocop', '~> 1.11', require: false
  gem 'rubocop-performance', '~> 1.10', '>= 1.10.1', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
end

group :test do
  # is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.17'
  # Collection cardinality matchers, extracted from rspec-expectations
  gem 'rspec-collection_matchers', '~> 1.2'
  # BDD for Ruby
  gem 'rspec', '~> 3.10'
end
