module Api::ApproachG::Things
  ##
  # Private class
  #
  class ShowThingInteractorBase
    include ApproachG::Versioned::Base

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
      Api::ApproachG::Things::ThingContract.new(version: version, thing: thing).call
    end

    def do_work
      thing[:work] = 'Interactor Base'
    end

    def call_serializer
      Api::ApproachG::Things::ThingSerializer.new(version: version, thing: thing).call
    end
  end

  ##
  # Private class
  #
  class ShowThingInteractorVersionA < ShowThingInteractorBase
    supports_versions_between '1.0.0', max_version

    def call
      call_contract
      do_work_2
      call_serializer
    end

    def do_work_2
      thing[:work] = 'Interactor VersionA'
    end
  end

  ##
  # Public class
  #
  class ShowThingInteractor < ShowThingInteractorVersionA
    prepend ApproachG::Versioned::Head
  end

  private_constant :ShowThingInteractorBase
  private_constant :ShowThingInteractorVersionA
end
