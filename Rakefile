require File.expand_path("../boot", __FILE__)
require "rake/testtask"
require "squeezon"

task :default => "test"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r squeezon.rb"
end

