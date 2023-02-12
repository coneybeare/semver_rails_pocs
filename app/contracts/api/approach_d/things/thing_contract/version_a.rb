class Api::ApproachD::Things::ThingContract::VersionA < Api::ApproachD::Things::ThingContract::Base
  def call
    super.tap { |t| t[:contract] = 'Contract VersionA' }
  end
end
