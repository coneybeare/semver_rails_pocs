module Api::ApproachE::Things
  ##
  # Private class
  #
  class ThingSerializerBase
    include ApproachE::Versioned

    def initialize(version:, thing:)
      @thing = thing
      super(version: version)
    end

    def call
      return super unless version_between?(min_version, '1.0.0')

      @thing.tap { |t| t[:serializer] = 'Serializer Base' }
    end
  end
  private_constant :ThingSerializerBase

  ##
  # Private class
  #
  class ThingSerializerVersionA < ThingSerializerBase
    def call
      return super unless version_between?('1.0.0', max_version)

      @thing.tap { |t| t[:serializer] = 'Serializer VersionA' }
    end
  end
  private_constant :ThingSerializerVersionA

  ##
  # Public class
  #
  class ThingSerializer < ThingSerializerVersionA
  end
end
