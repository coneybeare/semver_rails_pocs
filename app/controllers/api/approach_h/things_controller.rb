class Api::ApproachH::ThingsController < Api::ApproachH::VersionedController
  def show
    render json: Api::ApproachH::Things::ShowThingInteractor::ShowThing.new(version: version, params: params).call
  end
end
