module EasyConfig::EnvVar
  class << self
    def extended(base)
      setup(base)
    end

    def setup(base)
      env_vars.each do |key, configs|
        create_method(base, key, EasyConfig::Configuration.new(configs))
      end
    end

    def env_vars
      configs = {}
      ENV.each do |key, value|
        if key.downcase =~ /^([a-zA-Z][^_]+)_(\w+)/
          configs[$1] = configs.fetch($1, {})
          configs[$1][$2] = value
        end
      end
      configs
    end

    def create_method(base, name, value)
      base.class_eval do
        (class << self; self; end).instance_eval do
          define_method(name.to_sym) { value }
        end
      end
    end
  end
end
