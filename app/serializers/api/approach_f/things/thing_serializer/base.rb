module Api::ApproachF::Things::ThingSerializer
  class Base
    include ApproachF::Versioned

    def initialize(version:, thing:)
      @thing = thing
      super(version: version)
    end

    def call
      return super unless version_between?(min_version, '1.0.0')

      @thing.tap { |t| t[:serializer] = 'Serializer Base' }
    end
  end
  private_constant :Base
end
