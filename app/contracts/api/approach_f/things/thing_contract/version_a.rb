module Api::ApproachF::Things::ThingContract
  class VersionA < Base
    def call
      return super unless version_between?('1.0.0', '1.2.2')

      @thing.tap { |t| t[:contract] = 'Serializer VersionA' }
    end
  end
  private_constant :VersionA
end
