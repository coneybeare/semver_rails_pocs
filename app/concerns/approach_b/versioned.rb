module ApproachB::Versioned
  extend ActiveSupport::Concern

  included do
    MIN_SUPPORTED_VERSION = '0.0.1'
    MAX_SUPPORTED_VERSION = '1.2.3'
  end

  def initialize(*_args, version:, **_kwargs)
    @version = version
    raise Exception, 'Semver version must be passed' unless @version.present?
  end

  protected

  attr_accessor :version

  def min_version
    Semantic::Version.new(MIN_SUPPORTED_VERSION)
  end

  def max_version
    Semantic::Version.new(MAX_SUPPORTED_VERSION)
  end
end
