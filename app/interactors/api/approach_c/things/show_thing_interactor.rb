module Api::ApproachC::Things
  class ShowThingInteractor
    include ApproachC::Versioned

    def self.class_for_version(version:)
      case version
      when (min_version...'1.0.0') then Base
      when ('1.0.0'...'1.2.2')     then VersionA
      when ('1.2.2'..max_version)  then VersionB
      else
        super
      end
    end

    ##
    # Private internal class
    #
    class Base < ShowThingInteractor
      def initialize(params:)
        self.params = params
        self.thing = params.to_h
      end

      def call
        call_contract
        do_work
        call_serializer2
        call_serializer
      end

      private

      attr_accessor :params, :thing

      def call_contract
        Api::ApproachC::Things::ThingContract.new(version: version, thing: thing).call
      end

      def do_work
        thing[:work] = 'Interactor Base'
      end

      def call_serializer
        Api::ApproachC::Things::ThingSerializer.new(version: version, thing: thing).call
      end

      def call_serializer2
        Api::ApproachC::Things::ThingSerializer2.new(version: version).call
      end
    end
    private_constant :Base

    ##
    # Private internal class
    #
    class VersionA < Base
      def do_work
        thing[:work] = 'Interactor VersionA'
      end
    end
    private_constant :VersionA

    ##
    # Private internal class
    #
    class VersionB < Base
      def do_work
        thing[:work] = 'Interactor VersionB'
      end
    end
    private_constant :VersionB
  end
end
