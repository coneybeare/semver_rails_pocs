class Api::ApproachC::ThingsController < Api::ApproachC::VersionedController
  def show
    render json: Api::ApproachC::Things::ShowThingInteractor.new(version: version, params: params).call
  end
end
