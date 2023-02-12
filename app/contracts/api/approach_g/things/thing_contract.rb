module Api::ApproachG::Things
  ##
  # Private class
  #
  class ThingContractBase
    include ApproachG::Versioned::Base

    supports_versions_between min_version, '1.0.0'

    def initialize(thing:)
      @thing = thing
    end

    def call
      @thing.tap { |t| t[:contract] = 'Serializer Base' }
    end
  end

  ##
  # Private class
  #
  class ThingContractVersionA < ThingContractBase
    supports_versions_between '1.0.0', '1.2.2'

    def call
      @thing.tap { |t| t[:contract] = 'Serializer VersionA' }
    end
  end

  ##
  # Private class
  #
  class ThingContractVersionB < ThingContractVersionA
    supports_versions_between '1.2.2', max_version

    def call
      @thing.tap { |t| t[:contract] = 'Serializer VersionB' }
    end
  end

  ##
  # Public class
  #
  class ThingContract < ThingContractVersionB
    prepend ApproachG::Versioned::Head
  end

  private_constant :ThingContractBase
  private_constant :ThingContractVersionA
  private_constant :ThingContractVersionB
end
