class Api::ApproachG::ThingsController < Api::ApproachG::VersionedController
  def show
    render json: Api::ApproachG::Things::ShowThingInteractor.new(version: version, params: params).call
  end
end
