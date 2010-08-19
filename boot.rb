$:.unshift(File.dirname(__FILE__) + "/lib")

require "rubygems"
require "bundler/setup"

Bundler.require :default, (ENV["RACK_ENV"] || :development).to_sym
