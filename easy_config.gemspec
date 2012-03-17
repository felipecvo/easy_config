require File.expand_path("../lib/easy_config/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'easy_config'
  s.version     = EasyConfig::VERSION
  s.date        = '2012-03-17'
  s.summary     = "Easy config, Rails and Rack application's configuration made easy."
  s.description = s.summary
  s.authors     = ["Felipe Oliveira"]
  s.email       = 'felipecvo@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/easy_config'

  s.required_rubygems_version = ">= 1.3.6"

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {spec}/*`.split("\n")
  s.require_path = 'lib'

  s.add_dependency "methodize", "~> 0.2.1"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.9.0"
  s.add_development_dependency "rake"
end
