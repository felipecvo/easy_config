require 'bundler/setup'
require 'easy_config'

puts ENV['RACK_ENV']
ENV['RACK_ENV'] = 'asdf'
puts ENV['RACK_ENV']
ENV['RACK_ENV'] = nil
