# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require '../lib/omniauth-etrade/version'
require File.expand_path('../lib/omniauth-etrade/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-etrade"
  spec.version       = OmniAuth::Etrade::VERSION
  spec.authors       = ["Athens Holloway"]
  spec.email         = ["athensholloway@gmail.com"]
  spec.description   = %q{OmniAuth strategy of E*TRADE}
  spec.summary       = %q{OmniAuth strategy of E*TRADE}
  spec.homepage      = "https://github.com/athensholloway/omniauth-etrade"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth', '~> 1.0.1'
  
  spec.add_development_dependency 'rspec', '~> 2.7.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rack-test'  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
