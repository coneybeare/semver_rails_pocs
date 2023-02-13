module Api::ApproachH::Things::ThingSerializer
  class Thing < VersionA
    include ApproachH::Versioned::Head
  end

  private_constant :Base
  private_constant :VersionA
end
