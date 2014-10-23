module EasyConfig::PathResolver
  class << self
    def config_paths
      @config_paths ||= [default_config_path].compact
    end

    def clear!
      @config_paths = nil
    end

    private
    def default_config_path
      if defined?(Rails)
        File.join(Rails.root, 'config')
      elsif defined?(Sinatra)
        File.join(Sinatra::Application.root, 'config')
      end
    end
  end
end
