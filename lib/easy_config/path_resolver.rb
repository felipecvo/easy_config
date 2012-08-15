module EasyConfig::PathResolver
  def self.config_path=(value)
    @config_path = value
  end

  def self.config_path
    if defined?(@config_path) and @config_path
      File.join(@config_path, '*.yml')
    elsif defined?(Rails)
      File.join(Rails.root, 'config', '*.yml')
    elsif defined?(Sinatra)
      File.join(Sinatra::Application.root, 'config', '*.yml')
    else
      raise EasyConfig::UnknownConfigPath.new
    end
  end
end
