module EasyConfig
  class ConfigurationNotFound < NoMethodError; end
  class UnknownConfigPath < ArgumentError; end

  def self.method_missing(name)
    unless @loaded
      setup_config
      self.send name
    else
      raise ConfigurationNotFound.new("Configuration for '#{name}' was not found.")
    end
  end

  def self.setup_config
    EasyConfig::ConfigFile.all.each do |f|
      add_config_method(f)
    end
    @loaded = true
  end

  def self.add_config_method(config)
    (class << self; self; end).instance_eval do
      define_method config.name do
        config.configuration
      end
    end
  end

  def self.config_path=(path)
    EasyConfig::PathResolver.config_path = path
    self.reset!
  end

  def self.reset!
    EasyConfig::ConfigFile.reset!
    @loaded = false
    setup_config
  end
end

require 'easy_config/config_file'
require 'easy_config/configuration'
require 'easy_config/env'
require 'easy_config/path_resolver'
