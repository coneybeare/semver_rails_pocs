module Api::ApproachC::Things
  class ThingContract
    include ApproachC::Versioned

    def self.class_for_version(version:)
      case version
      when (min_version...'1.0.0') then Base
      when ('1.0.0'...'1.2.2')     then VersionA
      when ('1.2.2'..max_version)  then VersionB
      else
        raise NotImplementedError
      end
    end

    ##
    # Private internal class
    #
    class Base < ThingContract
      def initialize(thing:)
        @thing = thing
      end

      def call
        @thing.tap { |t| t[:contract] = 'Serializer Base' }
      end
    end
    private_constant :Base

    ##
    # Private internal class
    #
    class VersionA < Base
      def call
        super.tap { |t| t[:contract] = 'Serializer VersionA' }
      end
    end
    private_constant :VersionA

    ##
    # Private internal class
    #
    class VersionB < VersionA
      def call
        super.tap { |t| t[:contract] = 'Serializer VersionB' }
      end
    end
    private_constant :VersionB
  end
end
