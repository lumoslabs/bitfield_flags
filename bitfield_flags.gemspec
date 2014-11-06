# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitfield_flags/version'

Gem::Specification.new do |spec|
  spec.name          = "bitfield_flags"
  spec.version       = BitfieldFlags::VERSION
  spec.authors       = ["Carl Furrow"]
  spec.email         = ["carl@lumoslabs.com"]
  spec.description   = %q{Quickly add bitfield scopes to an active record model}
  spec.summary       = %q{Adds functionality to the bitfields gem to quickly add active record scopes to any model, for any bitfield}
  spec.homepage      = "http://github.com/lumoslabs"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'bitfields', '~> 0.4'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.3"
end
