module Api::ApproachH::Things::ShowThingInteractor
  class Base
    include ApproachH::Versioned::Base

    supports_versions_between min_version, '1.0.0'

    def initialize(params:)
      self.params = params
      self.thing = params.to_h
    end

    def call
      call_contract
      do_work
      call_serializer
    end

    private

    attr_accessor :params, :thing

    def call_contract
      Api::ApproachH::Things::ThingContract::Thing.new(version: version, thing: thing).call
    end

    def do_work
      thing[:work] = 'Interactor Base'
    end

    def call_serializer
      Api::ApproachH::Things::ThingSerializer::Thing.new(version: version, thing: thing).call
    end
  end
end
