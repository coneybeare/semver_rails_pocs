module Api::ApproachD::Things
  class ThingSerializer
    include ApproachD::Versioned

    def self.class_for_version(version:)
      case version
      when (min_version...'1.0.0') then ThingSerializer::Base
      when ('1.0.0'..max_version)  then ThingSerializer::VersionA
      else
        raise NotImplementedError
      end
    end
  end
end
