module Api::ApproachH::Things::ShowThingInteractor
  class ShowThing < VersionA
    prepend ApproachH::Versioned::Head
  end

  private_constant :Base
  private_constant :VersionA
end
