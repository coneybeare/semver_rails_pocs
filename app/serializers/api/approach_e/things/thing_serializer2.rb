module Api::ApproachE::Things
  ##
  # Private class
  #
  class ThingSerializer2Base
    include ApproachE::Versioned

    def call
      return super unless version_between?(min_version, '1.0.0')

      puts 1 + 1
    end
  end
  private_constant :ThingSerializer2Base

  ##
  # Private class
  #
  class ThingSerializer2VersionA < ThingSerializer2Base
    def call
      return super unless version_between?('1.0.0', max_version)

      puts 1 + 2
    end
  end
  private_constant :ThingSerializer2VersionA

  ##
  # Public class
  #
  class ThingSerializer2 < ThingSerializer2VersionA
  end
end
