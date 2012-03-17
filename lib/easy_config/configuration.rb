require 'methodize'

class EasyConfig::Configuration
  def initialize(config)
    @config = config.extend(Methodize)
  end

  def method_missing(name, *args)
    @config.send(name, *args)
  end
end
