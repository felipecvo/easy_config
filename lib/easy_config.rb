module EasyConfig
  def self.method_missing(name)
    file = nil
    file.configuration if file = EasyConfig::ConfigFile.all.find { |f| f.name == name }
  end
end

require 'easy_config/config_file'
require 'easy_config/configuration'
require 'easy_config/env'
require 'easy_config/path_resolver'
