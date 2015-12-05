# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hajimeru/version'

Gem::Specification.new do |spec|
  spec.name          = "hajimeru"
  spec.version       = Hajimeru::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]

  spec.summary       = %q{A scaffold generator for your project.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/myokoym/hajimeru"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.post_install_message = <<-MESSAGE
  !    The 'hajimeru' gem has been deprecated and has been replaced by 'hajimeru' gem.
  !    Because the name 'hajimeru' is used in the other project.
  MESSAGE

  spec.add_runtime_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
end