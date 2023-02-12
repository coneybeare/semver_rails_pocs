class Api::ApproachD::Things::ThingContract::VersionB < Api::ApproachD::Things::ThingContract::VersionA
  def call
    super.tap { |t| t[:contract] = 'Contract VersionB' }
  end
end
