source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
#  gem 'sqlite3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'pg', '~> 0.17'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'rest-client'
gem 'business_time' #allows <variable>.business_hour(s).<variable>/from_now (https://github.com/bokmann/business_time)
gem 'holidays' #For intergration with businesstime for public holidays (https://github.com/alexdunae/holidays)

# Add our security related gem here
gem 'devise', '~> 3.2'



group :doc do
  gem 'sdoc', '~> 0.4.0'
end
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development


group :test do
  gem 'rspec-rails', '~> 3.0'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'foreman'
  gem 'bugbye'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

