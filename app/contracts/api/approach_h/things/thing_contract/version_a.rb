module Api::ApproachH::Things::ThingContract
  class VersionA < Base
    supports_versions_between '1.0.0', '1.2.2'

    def call
      @thing.tap { |t| t[:contract] = 'Serializer VersionA' }
    end
  end
end
