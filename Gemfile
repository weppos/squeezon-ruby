source 'http://rubygems.org'
ruby '2.0.0'

gem 'sinatra', '~> 1.4.0', require: false
gem 'sinatra-contrib', require: false

gem 'puma'
gem 'activesupport', '~> 4.0.0'
gem 'feedzirra', github: 'pauldix/feedzirra'
gem 'i18n'
gem 'yajl-ruby', '~> 1.1.0', require: 'yajl'

group :test do
  gem 'mimic'
  gem 'mocha', require: false
  gem 'rack-test', require: 'rack/test'
end

group :development, :test do
  gem 'rspec', '~> 2.14.0'
end
