module Api::ApproachH::Things::ThingContract
  class VersionB < VersionA
    supports_versions_between '1.2.2', max_version

    def call
      @thing.tap { |t| t[:contract] = 'Serializer VersionB' }
    end
  end
end
