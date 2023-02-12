class Api::ApproachA::ThingsController < Api::ApproachA::VersionedController
  def show
    render json: Api::ApproachA::Things::ShowThingInteractor.new(version: version, params: params).call
  end
end
