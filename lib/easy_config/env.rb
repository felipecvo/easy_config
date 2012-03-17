module EasyConfig::Env
  def self.current
    if defined?(Rails)
      Rails.env
    elsif !ENV['RACK_ENV'].nil?
      ENV['RACK_ENV']
    else
      "development"
    end
  end

  def self.has_environment?(hash)
    hash.keys.include?(self.current)
  end
end
