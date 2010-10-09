ENV["RACK_ENV"] = "test"

require File.expand_path("../../boot", __FILE__)
require "squeezon"

unless defined?(SPEC_ROOT)
  SPEC_ROOT = Pathname.new(File.dirname(__FILE__))
end

RSpec.configure do |config|
  config.mock_with :mocha
  config.include Rack::Test::Methods
end
