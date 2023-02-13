module Api::ApproachH::Things::ThingContract
  class Base
    include ApproachH::Versioned::Base

    supports_versions_between min_version, '1.0.0'

    def initialize(thing:)
      @thing = thing
    end

    def call
      @thing.tap { |t| t[:contract] = 'Serializer Base' }
    end
  end
end
