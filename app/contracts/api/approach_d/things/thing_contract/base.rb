class Api::ApproachD::Things::ThingContract::Base < Api::ApproachD::Things::ThingContract
  def initialize(thing:)
    @thing = thing
  end

  def call
    @thing.tap { |t| t[:contract] = 'Contract Base' }
  end
end
