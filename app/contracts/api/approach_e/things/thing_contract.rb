module Api::ApproachE::Things
  ##
  # Private class
  #
  class ThingContractBase
    include ApproachE::Versioned

    def initialize(version:, thing:)
      @thing = thing
      super(version: version)
    end

    def call
      return super unless version_between?(min_version, '1.0.0')

      @thing.tap { |t| t[:contract] = 'Serializer Base' }
    end
  end
  private_constant :ThingContractBase

  ##
  # Private class
  #
  class ThingContractVersionA < ThingContractBase
    def call
      return super unless version_between?('1.0.0', '1.2.2')

      @thing.tap { |t| t[:contract] = 'Serializer VersionA' }
    end
  end
  private_constant :ThingContractVersionA

  ##
  # Private class
  #
  class ThingContractVersionB < ThingContractVersionA
    def call
      return super unless version_between?('1.2.2', max_version)

      @thing.tap { |t| t[:contract] = 'Serializer VersionB' }
    end
  end
  private_constant :ThingContractVersionB

  ##
  # Public class
  #
  class ThingContract < ThingContractVersionB
  end
end
