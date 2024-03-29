lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'sorting_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "sorting_helper"
  spec.version       = SortingHelper::VERSION
  spec.authors       = ["Okhlopkov Anatoly"]
  spec.email         = ["ohlopkov0211@gmail.com"]
  spec.summary       = 'Rails helpers for building "sort by column" links.'
  spec.description   = 'Rails helpers for building "sort by column" links.'
  spec.homepage      = 'https://github.com/VortexGrenade/sorting_helper'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 3'
  spec.add_dependency 'rails', '>= 4.0.0'

  spec.add_development_dependency 'bundler', '~> 1'
  spec.add_development_dependency 'rake', '~> 10'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
