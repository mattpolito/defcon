source :rubygems

gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2', '~> 0.3.6'
gem 'aasm'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem "haml", :git => 'git://github.com/nex3/haml.git'
gem "hoptoad_notifier"
gem "jquery-rails"
gem "devise"
gem "settingslogic"
gem "simple_form"
gem "decent_exposure"

group :development do
  gem "haml-rails"
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :development, :test do
  gem "capybara"
  gem "cucumber"
  gem "rspec-rails"
  gem "shoulda-matchers", :git => 'git://github.com/thoughtbot/shoulda-matchers.git'
  gem "awesome_print", :require => 'ap'
  gem "factory_girl_rails", "1.1.rc1"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
