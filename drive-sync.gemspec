# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'drive/sync/version'

Gem::Specification.new do |spec|
  spec.name          = "drive-sync"
  spec.version       = Drive::Sync::VERSION
  spec.authors       = ["flosell"]
  spec.email         = ["florian.sellmayr@gmail.com"]
  spec.summary       = %q{This is a tool for working with google app scripts on the local machine}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["drive-sync"] #spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
