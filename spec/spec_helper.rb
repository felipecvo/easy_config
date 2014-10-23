require 'bundler/setup'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'easy_config'

ENV['RACK_ENV'] = nil
