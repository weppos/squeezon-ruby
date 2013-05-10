require ::File.expand_path('../boot', __FILE__)
require 'rspec/core/rake_task'

task :default => "spec"

RSpec::Core::RakeTask.new

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r dnsimpled.rb"
end
