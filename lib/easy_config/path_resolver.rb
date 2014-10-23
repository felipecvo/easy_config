module EasyConfig::PathResolver
  class << self
    def config_path=(value)
      value = File.join(value, '*.yml') unless value.nil? or /\*\.ya?ml$/ =~ value
      @config_path = value
    end

    def config_path
      @config_path ||= File.join(default_config_path!, '*.yml')
    end

    def config_paths
      @config_paths ||= [default_config_path].compact
    end

    def clear!
      @config_paths = nil
    end

    private
    def default_config_path!
      default_config_path or raise EasyConfig::UnknownConfigPath.new
    end

    def default_config_path
      if defined?(Rails)
        File.join(Rails.root, 'config')
      elsif defined?(Sinatra)
        File.join(Sinatra::Application.root, 'config')
      end
    end
  end
end
