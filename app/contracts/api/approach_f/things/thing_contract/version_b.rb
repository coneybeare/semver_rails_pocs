module Api::ApproachF::Things::ThingContract
  class VersionB < VersionA
    def call
      return super unless version_between?('1.2.2', max_version)

      @thing.tap { |t| t[:contract] = 'Serializer VersionB' }
    end
  end
  private_constant :VersionB
end
