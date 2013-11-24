$LOAD_PATH.unshift ::File.expand_path('../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'

RACK_ENV = (ENV["RACK_ENV"] || :development).to_sym

Bundler.require :default, RACK_ENV
