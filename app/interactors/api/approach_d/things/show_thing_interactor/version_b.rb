class Api::ApproachD::Things::ShowThingInteractor::VersionB < Api::ApproachD::Things::ShowThingInteractor::VersionA
  def do_work
    thing[:work] = 'Interactor VersionB'
  end
end
