module ApproachC::Versioned
  extend ActiveSupport::Concern

  included do
    attr_accessor :version
  end

  class_methods do
    MIN_SUPPORTED_VERSION = '0.0.1'
    MAX_SUPPORTED_VERSION = '1.2.3'

    def new(*args, version:, **kwargs)
      return super(*args, **kwargs) unless version

      class_for_version(version: version).new(*args, version: nil, **kwargs).tap do |instance|
        instance.version = version
      end
    end

    def initialize
      raise Exception, 'This wrapper class should never be called'
    end

    def class_for_version(version:)
      raise NotImplementedError('Subclasses must implement')
    end

    def min_version
      Semantic::Version.new(MIN_SUPPORTED_VERSION)
    end

    def max_version
      Semantic::Version.new(MAX_SUPPORTED_VERSION)
    end
  end
end
