class Api::ApproachA::Things::ShowThingInteractor < Api::ApproachA::VersionedInteractor
  def initialize(version:, params:)
    self.params = params
    self.thing = params.to_h
    super
  end

  def call
    call_contract
    do_work
    call_serializer
  end

  private

  attr_accessor :params, :thing

  def call_contract
    thing[:contract] = case version
                       when (min_version...'1.0.0') then Api::ApproachA::Things::ThingContractA
                       when ('1.0.0'...'1.2.2')     then Api::ApproachA::Things::ThingContractB
                       when ('1.2.2'..max_version)  then Api::ApproachA::Things::ThingContractC
                       else
                         raise NotImplementedError
                       end
    thing
  end

  def do_work; end

  def call_serializer
    thing[:serializer] = case version
                         when (min_version...'1.0.0') then Api::ApproachA::Things::ThingSerializerA
                         when ('1.0.0'..max_version)  then Api::ApproachA::Things::ThingSerializerB
                         else
                           raise NotImplementedError
                         end
    thing
  end
end
