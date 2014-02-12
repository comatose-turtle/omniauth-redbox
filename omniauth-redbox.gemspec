# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-redbox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Orr"]
  gem.email         = ["tommy@getsmartify.com"]
  gem.description   = %q{OmniAuth strategy for RedBox.}
  gem.summary       = %q{OmniAuth strategy for RedBox.}
  gem.homepage      = "https://github.com/comatose_turtle/omniauth-redbox"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-redbox"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::RedBox::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
