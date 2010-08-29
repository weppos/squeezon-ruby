require File.expand_path("../boot", __FILE__)
require "spec/rake/spectask"
require "squeezon"

task :default => "spec"

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ["--options", %Q{"#{File.dirname(__FILE__)}/spec/spec.opts"}]
  t.spec_files = FileList["spec/**/*_spec.rb"]
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r squeezon.rb"
end
