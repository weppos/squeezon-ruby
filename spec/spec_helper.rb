ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../boot", __FILE__)
require "spec"
require "squeezon"

TESTCASES_PATH = Pathname.new(File.expand_path("../testcases", __FILE__))

Spec::Runner.configure do |conf|
  conf.mock_with :mocha
  conf.include Rack::Test::Methods
end
