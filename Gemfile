source 'https://rubygems.org'

ruby '2.3.0'

group :production do
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
  gem 'omniauth-yahoo-oauth2', git: 'https://github.com/sarahveness/omniauth-yahoo-oauth2.git'

  # Use sqlite3 as the database for Active Record
  gem 'pg'

  # Use Puma as the app server
  gem 'puma', '~> 3.0'
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 5.0'
  # Use Uglifier as compressor for JavaScript assets

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
  gem 'waypoints-rails', '~> 0.1'
  gem 'uglifier'
  # gem 'jquery-waypoints-rails', '~> 2.0', '>= 2.0.5'
  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.5'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
  # Use ActiveModel has_secure_password
  gem 'bcrypt', '~> 3.1.7'

  gem 'httparty'
  gem 'dotenv-rails'
  gem 'omniauth'
  gem "highcharts-rails"
  gem 'foundation-rails'
  gem "table-for"

  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development
  gem 'listen', '~> 3.0.5'
  gem 'bootstrap-sass'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'


  gem "activerecord-import"
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'web-console'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
