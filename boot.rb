$LOAD_PATH.unshift ::File.expand_path("../lib", __FILE__)

require "rubygems"
require "bundler/setup"

Bundler.require :default, (ENV["RACK_ENV"] || :development).to_sym
