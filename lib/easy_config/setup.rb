module EasyConfig
  module Setup
    def method_missing(name)
      unless @loaded
        setup_config
        self.send name
      else
        raise ConfigurationNotFound.new("Configuration for '#{name}' was not found.")
      end
    end

    def setup_config
      EasyConfig::ConfigFile.all.each do |f|
        add_config_method(f)
      end
      @loaded = true
    end

    def add_config_method(config)
      (class << self; self; end).instance_eval do
        define_method config.name do
          config.configuration
        end
      end
    end

    def config_path=(path)
      EasyConfig::PathResolver.clear!
      EasyConfig::PathResolver.config_paths << path
      self.reset!
    end

    def append_config_path(path)
      reset if @loaded
      EasyConfig::PathResolver.config_paths << path
    end

    def reset
      EasyConfig::ConfigFile.reset!
      @loaded = false
    end

    def reset!
      reset
      setup_config
    end

    def environment
      EasyConfig::Env.current
    end

    def environment=(env)
      EasyConfig::Env.set(env)
    end
  end
end
