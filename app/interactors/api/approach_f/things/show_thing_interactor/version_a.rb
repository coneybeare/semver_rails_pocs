module Api::ApproachF::Things::ShowThingInteractor
  class VersionA < Base
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
  private_constant :VersionA
end
