module Api::ApproachH::Things::ThingContract
  class Thing < VersionB
    prepend ApproachH::Versioned::Head
  end

  private_constant :Base
  private_constant :VersionA
  private_constant :VersionB
end
