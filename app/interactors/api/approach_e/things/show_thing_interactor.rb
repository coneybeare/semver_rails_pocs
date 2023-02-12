module Api::ApproachE::Things
  ##
  # Private class
  #
  class ShowThingInteractorBase
    include ApproachE::Versioned

    def initialize(version:, params:)
      self.params = params
      self.thing = params.to_h
      super(version: version)
    end

    def call
      return super unless version_between?(min_version, '1.0.0')

      call_contract
      do_work
      call_serializer2
      call_serializer
    end

    private

    attr_accessor :params, :thing

    def call_contract
      Api::ApproachE::Things::ThingContract.new(version: version, thing: thing).call
    end

    def do_work
      thing[:work] = 'Interactor Base'
    end

    def call_serializer
      Api::ApproachE::Things::ThingSerializer.new(version: version, thing: thing).call
    end

    def call_serializer2
      Api::ApproachE::Things::ThingSerializer2.new(version: version).call
    end
  end
  private_constant :ShowThingInteractorBase

  ##
  # Private class
  #
  class ShowThingInteractorVersionA < ShowThingInteractorBase
    def call
      return super unless version_between?('1.0.0', max_version)

      call_contract
      do_work
      call_serializer
    end

    def do_work
      thing[:work] = 'Interactor VersionA'
    end
  end
  private_constant :ShowThingInteractorVersionA

  ##
  # Public class
  #
  class ShowThingInteractor < ShowThingInteractorVersionA
  end
end
