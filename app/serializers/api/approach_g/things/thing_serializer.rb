module Api::ApproachG::Things
  ##
  # Private class
  #
  class ThingSerializerBase
    include ApproachG::Versioned::Base

    supports_versions_between min_version, '1.0.0'

    def initialize(thing:)
      @thing = thing
    end

    def call
      @thing.tap { |t| t[:serializer] = 'Serializer Base' }
    end
  end

  ##
  # Private class
  #
  class ThingSerializerVersionA < ThingSerializerBase
    supports_versions_between '1.0.0', max_version

    def call
      @thing.tap { |t| t[:serializer] = 'Serializer VersionA' }
    end
  end

  ##
  # Public class
  #
  class ThingSerializer < ThingSerializerVersionA
    include ApproachG::Versioned::Head
  end

  private_constant :ThingSerializerBase
  private_constant :ThingSerializerVersionA
end
