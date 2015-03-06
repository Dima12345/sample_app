source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.2.1.rc1'
gem 'bootstrap-sass', '2.3.2.0'

group :development, :test do
	gem 'sqlite3'
	gem 'rspec-rails', '2.13.1'
end

group :test do
	gem 'minitest', '~> 5.5.1'
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.1'
	
	gem 'cucumber-rails', '1.4.0', :require => false
	gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

gem 'sass-rails', '~> 5.0'
gem 'bcrypt-ruby', '3.1.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

group :doc do
	gem 'sdoc', '~> 0.4.0', group: :doc
end

group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

#group :development, :test do
  #gem 'debugger'

  #gem 'web-console', '~> 2.0'
  #gem 'spring'
#end
