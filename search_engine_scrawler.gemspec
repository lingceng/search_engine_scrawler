# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_engine_scrawler/version'

Gem::Specification.new do |spec|
  spec.name          = "search_engine_scrawler"
  spec.version       = SearchEngineScrawler::VERSION
  spec.authors       = ["lingceng"]
  spec.email         = ["lingceng2008@gmail.com"]
  spec.summary       = %q{Collect info through a search engine.}
  spec.description   = %q{Collect info through a search engine.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
