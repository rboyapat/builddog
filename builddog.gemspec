# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'builddog/version'

Gem::Specification.new do |spec|
  spec.name          = "builddog"
  spec.version       = BuildDog::VERSION
  spec.authors       = ["rboyapat"]
  spec.email         = ["rboyapat@gmail.com"]
  spec.summary       = %q{Build tool tooooo deploy servers across datacenters}
  spec.description   = %q{---}
  spec.homepage      = "http://github.com/rboyapat/builddog"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rbvmomi", "~>1.8.2"
  spec.add_development_dependency "nokogiri"
end
