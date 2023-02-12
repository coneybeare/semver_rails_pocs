module Api::ApproachD::Things
  class ShowThingInteractor
    include ApproachD::Versioned

    def self.class_for_version(version:)
      case version
      when (min_version...'1.0.0') then ShowThingInteractor::Base
      when ('1.0.0'...'1.2.2')     then ShowThingInteractor::VersionA
      when ('1.2.2'..max_version)  then ShowThingInteractor::VersionB
      else
        super
      end
    end
  end
end
