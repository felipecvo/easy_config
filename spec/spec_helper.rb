require 'bundler/setup'
if RUBY_VERSION > "1.8.7"
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

ENV['APP_ENV'] = 'dev'

require 'easy_config'

ENV['RACK_ENV'] = nil
