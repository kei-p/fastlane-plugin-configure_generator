# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/configure_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-configure_generator'
  spec.version       = Fastlane::ConfigureGenerator::VERSION
  spec.author        = %q{Keisuke Ishizawa}
  spec.email         = %q{muddyapesjm66@gmail.com}

  spec.summary       = %q{Generate configure file}
  spec.homepage      = "https://github.com/kei-p/fastlane-plugin-configure_generator"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.105.2'
end
