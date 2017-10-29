source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

gem 'pg', '~> 0.21'

# Use Puma as the app server
gem 'puma', '~> 3.10'

# Password
gem 'bcrypt', '~> 3.1.7'

# API
gem 'grape', '~> 1.0.1'
gem 'grape-entity', '~> 0.6.1'
gem 'grape-swagger', '~> 0.27.3'
gem 'grape-swagger-entity', '~> 0.2.1'
gem 'jwt', '~> 2.0.0'

# Codecoverage
gem 'coveralls', require: false

group :development, :test do
  gem 'dotenv-rails', '~> 2.2.1'

  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'

  # Testing
  gem 'factory_bot_rails', '~> 4.0'
  gem 'json_matchers', '~> 0.7.0'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'rspec_junit_formatter', '~> 0.3.0', require: false
  gem 'webmock', '~> 3.0.1', require: false

  gem 'rubocop', '~> 0.49.1', require: false
  gem 'rubocop-checkstyle_formatter', '~> 0.4.0', require: false
  gem 'rubocop-rspec', '~> 1.16.0', require: false

  gem 'simplecov', '~> 0.15.1', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
