class Api::ApproachD::Things::ShowThingInteractor::Base < Api::ApproachD::Things::ShowThingInteractor
  def initialize(params:)
    self.params = params
    self.thing = params.to_h
  end

  def call
    call_contract
    do_work
    call_serializer2
    call_serializer
  end

  private

  attr_accessor :params, :thing

  def call_contract
    Api::ApproachD::Things::ThingContract.new(version: version, thing: thing).call
  end

  def do_work
    thing[:work] = 'Interactor Base'
  end

  def call_serializer
    Api::ApproachD::Things::ThingSerializer.new(version: version, thing: thing).call
  end

  def call_serializer2
    Api::ApproachD::Things::ThingSerializer2.new(version: version).call
  end
end
