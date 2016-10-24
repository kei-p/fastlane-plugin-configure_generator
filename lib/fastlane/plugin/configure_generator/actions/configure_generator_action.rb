module Fastlane
  module Actions
    class ConfigureGeneratorAction < Action
      def self.run(params)
        body = Renderer.new(
          params[:template], params[:attributes]
        ).render

        output_path = params[:output]
        File.write(output_path, body)
        UI.message("Generate #{output_path}")
      end

      def self.description
        "Generate configure file"
      end

      def self.authors
        ["Keisuke Ishizawa"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :template,
            description: "template file path",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :attributes,
            description: "attributes",
            optional: false,
            type: Hash
          ),
          FastlaneCore::ConfigItem.new(
            key: :output,
            description: "output file path",
            optional: false,
            type: String
          ),
        ]
      end

      def self.is_supported?(platform)
        true
      end

      class Renderer
        attr_reader :attributes, :template_path, :template

        def initialize(template_path, attributes)
          @template_path = template_path
          @template = File.read(template_path)
          @attributes = attributes
        end

        def extname
          File.extname(template_path.gsub(/.erb$/,""))
        end

        def render
          ERB.new(template).result(binding)
        end
      end
    end
  end
end
