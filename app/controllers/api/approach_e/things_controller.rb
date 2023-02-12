class Api::ApproachE::ThingsController < Api::ApproachE::VersionedController
  def show
    render json: Api::ApproachE::Things::ShowThingInteractor.new(version: version, params: params).call
  end
end
