module Api::ApproachD::Things
  class ThingContract
    include ApproachD::Versioned

    def self.class_for_version(version:)
      case version
      when (min_version...'1.0.0') then ThingContract::Base
      when ('1.0.0'...'1.2.2')     then ThingContract::VersionA
      when ('1.2.2'..max_version)  then ThingContract::VersionB
      else
        raise NotImplementedError
      end
    end
  end
end
