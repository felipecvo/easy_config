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
    yaml = yaml_data

    yaml = yaml[EasyConfig::Env.current] if EasyConfig::Env.has_environment?(yaml)

    EasyConfig::Configuration.new(yaml)
  end

  def yaml_data
    input = File.read(@path)
    eruby = ERB.new(input)
    YAML.load(eruby.result)
  end

  class << self
    def all
      @all ||= load_all
    end

    def reset!
      @all = nil
    end

    private
    def load_all
      all = []
      EasyConfig::PathResolver.config_paths.each do |config_path|
        Dir.glob(File.join(config_path, '*.yml')).each do |yaml_file|
          all << EasyConfig::ConfigFile.new(yaml_file)
        end
      end
      all
    end
  end
end
