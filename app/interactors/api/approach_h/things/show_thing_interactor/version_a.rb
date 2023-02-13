module Api::ApproachH::Things::ShowThingInteractor
  class VersionA < Base
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
end
