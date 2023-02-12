class Api::ApproachD::Things::ThingSerializer::VersionA < Api::ApproachD::Things::ThingSerializer::Base
  def call
    super.tap { |t| t[:serializer] = 'Serializer VersionA' }
  end
end
