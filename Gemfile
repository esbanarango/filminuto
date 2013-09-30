source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '~> 0.14.1'
gem 'bcrypt-ruby', '~> 3.0.0'               # To use ActiveModel has_secure_password
gem 'acts_as_api', '~> 0.4.1'               # "Makes creating XML/JSON responses in Rails 3 easy and fun."
gem 'cancan', '~> 1.6.8'                    # "Authorization library to restricts what resources a given user is allowed to access."
gem 'devise', '~> 2.1.2'                    # Authentication
gem 'acts_as_paranoid', '~> 0.4.1'          # To hide and restore records without actually deleting them
gem 'paperclip', '~> 3.4.0'
gem 'paperclip-ffmpeg', '~> 0.10.1'          # Process the attachments with FFMPEG
gem 'delayed_paperclip', '~> 2.5.1.0'
gem 'delayed_job_active_record', '~> 0.4.1' # ActiveRecord backend for Delayed::Job
gem 'mini_exiftool', '~> 1.6.0'             # Wrapper for the Exiftool command-line application 
gem 'simple_form', '~> 2.0.4'
gem 'jquery-rails', '~> 2.2.0'
gem "thin"
gem 'coveralls', require: false

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'bootswatch-rails', '~> 0.3.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'annotate', '>=2.5.0'
  gem 'spork-rails', '~> 3.2.1'
  gem 'quiet_assets', '~> 1.0.1'
  gem 'better_errors', '~> 0.3.2'
  gem 'binding_of_caller', '~> 0.6.8'
end

group :test, :development do

  gem 'version_gemfile', '~> 1.0.0'
  gem 'rspec-rails', '~> 2.12.2'
  gem 'factory_girl_rails', '~> 4.2.0'
  gem 'launchy', '~> 2.1.2'

  gem 'dotenv', '~> 0.5.0'
end

group :test do
  gem 'faker', '~> 1.1.2'
  gem 'capybara', '~> 2.0.2'
  gem 'database_cleaner', '~> 0.9.1'
  gem 'email_spec', '~> 1.4.0'
  gem 'shoulda-matchers', '~> 1.4.2'
  # Default Test Script on Tracis CI
  gem 'rake','~> 10.0.3'
end

