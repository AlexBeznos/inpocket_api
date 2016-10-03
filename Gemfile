source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'puma-heroku'

gem 'sidekiq'
gem 'sidekiq-superworker'
gem 'geocoder'
gem 'default_value_for'
gem 'rabl-rails'
gem 'rabl'
gem 'oj'
gem 'responders'
gem 'kaminari'
gem 'email_validator'
gem 'newrelic_rpm'

gem 'activemodel-serializers-xml'
gem 'draper', github: 'audionerd/draper', branch: 'rails5'

gem 'exception_notification'
gem 'slack-notifier'

gem 'carrierwave'
gem 'carrierwave-aws'
gem 'carrierwave-base64', github: 'AlexBeznos/carrierwave-base64'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'poster_api', github: 'AlexBeznos/poster_api'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'rack-attack'
gem 'rack-health'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'figaro'
  gem 'foreman'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.3.1'
