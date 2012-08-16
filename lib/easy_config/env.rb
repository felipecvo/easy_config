module EasyConfig::Env
  def self.current
    @env ||= get_default
  end

  def self.has_environment?(hash)
    hash.keys.include?(self.current)
  end

  def self.set(env)
    @env = env
  end

  private
  def self.get_default
    if defined?(Rails)
      Rails.env
    elsif !ENV['RACK_ENV'].nil?
      ENV['RACK_ENV']
    else
      "development"
    end
  end
end
