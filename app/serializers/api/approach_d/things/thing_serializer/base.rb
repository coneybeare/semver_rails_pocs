class Api::ApproachD::Things::ThingSerializer::Base < Api::ApproachD::Things::ThingSerializer
  def initialize(thing:)
    @thing = thing
  end

  def call
    @thing.tap { |t| t[:serializer] = 'Serializer Base' }
  end
end
