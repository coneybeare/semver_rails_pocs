class Api::ApproachF::ThingsController < Api::ApproachF::VersionedController
  def show
    render json: Api::ApproachF::Things::ShowThingInteractor::Head.new(version: version, params: params).call
  end
end
