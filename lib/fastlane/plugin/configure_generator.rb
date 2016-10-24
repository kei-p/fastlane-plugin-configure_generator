require 'fastlane/plugin/configure_generator/version'
require 'active_support'
require 'active_support/core_ext'

module Fastlane
  module ConfigureGenerator
    def self.all_classes
      Dir[File.expand_path('**/{actions,helper}/*.rb', File.dirname(__FILE__))]
    end

    def self.autoload_default_render_helpers
      Dir[File.expand_path("../configure_generator/renderer_helpers/*", __FILE__)].each do |file|
        require file
        mod = Module.const_get("Fastlane::RendererHelpers::#{File.basename(file, ".*").capitalize}")
        self.renderer_include(mod)
      end
    end

    def self.renderer_include(module_class)
      Fastlane::Actions::ConfigureGeneratorAction::Renderer.include module_class
    end
  end
end

Fastlane::ConfigureGenerator.all_classes.each do |current|
  require current
end

Fastlane::ConfigureGenerator.autoload_default_render_helpers
