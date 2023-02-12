class Api::ApproachD::Things::ShowThingInteractor::VersionA < Api::ApproachD::Things::ShowThingInteractor::Base
  def do_work
    thing[:work] = 'Interactor VersionA'
  end
end
