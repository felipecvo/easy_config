require 'rubygems'
require 'bundler'

Bundler::GemHelper.install_tasks

desc "run the spec suite"
task :spec do
    system "rspec -cfp spec"
end

task :default => :spec
