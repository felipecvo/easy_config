require 'yaml'
require 'easy_config/setup'
require 'easy_config/config_file'
require 'easy_config/configuration'
require 'easy_config/env'
require 'easy_config/path_resolver'

module EasyConfig
  class ConfigurationNotFound < NoMethodError; end
  class UnknownConfigPath < ArgumentError; end

  extend Setup
end
