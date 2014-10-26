require 'ostruct'

class EasyConfig::Configuration
  def initialize(config)
    create_methods(config)
  end

  def create_methods(config)
    config.each do |key, value|
      value = OpenStruct.new(value) if value.is_a?(Hash)
      define_singleton_method(key.to_sym) { value }
    end
  end

  def method_missing(name, *args)
    nil
  end

  if RUBY_VERSION < "1.9"
    def define_singleton_method(name, &block)
      singleton = class << self; self end
      singleton.send(:define_method, name, &block)
    end
  end
end
