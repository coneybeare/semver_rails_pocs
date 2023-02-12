class Api::ApproachB::Things::ShowThingInteractor
  include ApproachB::Versioned

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
    Api::ApproachB::Things::ThingContract.new(version: version, thing: thing).call
  end

  def logic_a
    "#{self.class.name} logic A"
  end

  def logic_b
    "#{self.class.name} logic B"
  end

  def logic_c
    "#{self.class.name} logic C"
  end

  def do_work
    @thing[:work] = case version
                    when (min_version...'1.0.0') then logic_a
                    when ('1.0.0'...'1.2.2')     then logic_b
                    when ('1.2.2'..max_version)  then logic_c
                    else
                      raise NotImplementedError
                    end
    @thing
  end

  def call_serializer
    Api::ApproachB::Things::ThingSerializer.new(version: version, thing: thing).call
  end
end
