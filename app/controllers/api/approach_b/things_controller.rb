class Api::ApproachB::ThingsController < Api::ApproachB::VersionedController
  def show
    render json: Api::ApproachB::Things::ShowThingInteractor.new(version: version, params: params).call
  end
end
