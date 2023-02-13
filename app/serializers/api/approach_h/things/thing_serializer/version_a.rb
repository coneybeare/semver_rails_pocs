module Api::ApproachH::Things::ThingSerializer
  class VersionA < Base
    supports_versions_between '1.0.0', max_version

    def call
      @thing.tap { |t| t[:serializer] = 'Serializer VersionA' }
    end
  end
end
