describe Fastlane::Actions::ConfigureGeneratorAction do
  describe '#run' do
    it 'render' do
      Fastlane::Actions::ConfigureGeneratorAction.run(
        template: "templates/template.swift.erb",
        attributes: {
          class_name: 'configuration',
          variables: {
            hoge: 'hoge',
            fuga: 'foge',
            fuga_fuga: 'foge',
            fugafugagaga: 'foge'
          }
        },
        output: 'out/configure.swift'
      )
    end
  end
end
