class EasyConfig::ConfigFile
  attr_reader :name

  def initialize(path)
    @path = path
    @name = File.basename(path, '.*').to_sym
  end

  def configuration
    @configuration ||= create_configuration
  end

  def create_configuration
    yaml = YAML::load_file(@path)

    yaml = yaml[EasyConfig::Env.current] if EasyConfig::Env.has_environment?(yaml)

    EasyConfig::Configuration.new(yaml)
  end

  def self.all
    @all ||= Dir.glob(EasyConfig::PathResolver.config_path).map do |path|
      EasyConfig::ConfigFile.new path
    end
  end

  def self.reset!
    @all = nil
  end
end
