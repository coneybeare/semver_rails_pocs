module Api::ApproachD::Things
  class ThingSerializer2
    include ApproachD::Versioned

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
    class Base < ThingSerializer2
      def call
        puts 1 + 1
      end
    end
    private_constant :Base

    ##
    # Private internal class
    #
    class VersionA < Base
      def call
        puts 1 + 2
      end
    end
    private_constant :VersionA
  end
end
