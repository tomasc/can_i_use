# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caniuse/version'

Gem::Specification.new do |spec|
  spec.name          = "caniuse"
  spec.version       = Caniuse::VERSION
  spec.authors       = ["Tomas Celizna"]
  spec.email         = ["tomas.celizna@gmail.com"]
  spec.summary       = %q{Very light Ruby wrapper on caniuse data.}
  spec.description   = %q{Very light Ruby wrapper on caniuse data.}
  spec.homepage      = "https://github.com/tomasc/caniuse"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
end
