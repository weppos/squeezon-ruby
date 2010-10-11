source "http://rubygems.org"

gem "sinatra",        "~> 1.0.0", :require => false
gem "json",           "~> 1.4.0"
gem "activesupport",  "~> 3.0.0"
gem "feedzirra"
gem "newrelic_rpm",   :require => false

group :test do
  gem "mimic"
  gem "mocha",                "~> 0.9.8"
  gem "rack-test", :require => "rack/test"
end

group :development, :test do
  gem "rspec",                "~> 2.0.0"
end
