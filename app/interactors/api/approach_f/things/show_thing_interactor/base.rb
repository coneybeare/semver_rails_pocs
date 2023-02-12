module Api::ApproachF::Things::ShowThingInteractor
  class Base
    include ApproachF::Versioned

    def initialize(version:, params:)
      self.params = params
      self.thing = params.to_h
      super(version: version)
    end

    def call
      return super unless version_between?(min_version, '1.0.0')

      call_contract
      do_work
      call_serializer
    end

    private

    attr_accessor :params, :thing

    def call_contract
      Api::ApproachF::Things::ThingContract::Head.new(version: version, thing: thing).call
    end

    def do_work
      thing[:work] = 'Interactor Base'
    end

    def call_serializer
      Api::ApproachF::Things::ThingSerializer::Head.new(version: version, thing: thing).call
    end
  end
  private_constant :Base
end
