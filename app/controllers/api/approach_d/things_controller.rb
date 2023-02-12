class Api::ApproachD::ThingsController < Api::ApproachD::VersionedController
  def show
    render json: Api::ApproachD::Things::ShowThingInteractor.new(version: version, params: params).call
  end
end
