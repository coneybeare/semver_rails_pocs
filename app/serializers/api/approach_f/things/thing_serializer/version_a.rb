module Api::ApproachF::Things::ThingSerializer
  class VersionA < Base
    def call
      return super unless version_between?('1.0.0', max_version)

      @thing.tap { |t| t[:serializer] = 'Serializer VersionA' }
    end
  end
  private_constant :VersionA
end
