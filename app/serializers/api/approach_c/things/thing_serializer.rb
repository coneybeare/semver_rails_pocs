module Api::ApproachC::Things
  class ThingSerializer
    include ApproachC::Versioned

    def self.class_for_version(version:)
      case version
      when (min_version...'1.0.0') then Base
      when ('1.0.0'..max_version)  then VersionA
      else
        raise NotImplementedError
      end
    end

    ##
    # Private internal class
    #
    class Base < ThingSerializer
      def initialize(thing:)
        @thing = thing
      end

      def call
        @thing.tap { |t| t[:serializer] = 'Serializer Base' }
      end
    end
    private_constant :Base

    ##
    # Private internal class
    #
    class VersionA < Base
      def call
        super.tap { |t| t[:serializer] = 'Serializer VersionA' }
      end
    end
    private_constant :VersionA
  end
end
