module EasyConfig::PathResolver
  def self.config_path=(value)
    @config_path = value
  end

  def self.config_path
    puts 'config_path'
    if defined?(@config_path) and @config_path
      puts 'config_path => 1'
      File.join(@config_path, '*.yml')
    elsif defined?(Rails)
      puts 'config_path => 2'
      File.join(Rails.root, 'config', '*.yml')
    elsif defined?(Sinatra)
      puts 'config_path => 3'
      File.join(Sinatra::Application.root, 'config', '*.yml')
    else
      puts 'config_path => 4'
      raise EasyConfig::UnknownConfigPath.new
    end
  end
end
