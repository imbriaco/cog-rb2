# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cog'

Gem::Specification.new do |spec|
  spec.name          = "cog-rb2"
  spec.version       = Cog::VERSION
  spec.authors       = ["Mark Imbriaco"]
  spec.email         = ["mark@operable.io"]
  spec.licenses      = ["Apache-2.0"]

  spec.summary       = "Cog command helper library"
  spec.homepage      = "https://github.com/operable/cog-rb"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 11.2"
  spec.add_dependency "activesupport", "~> 5.0"
  spec.add_development_dependency "bundler", "~> 1.11"
end
