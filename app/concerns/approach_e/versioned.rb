module ApproachE::Versioned
  extend ActiveSupport::Concern

  included do
    MIN_SUPPORTED_VERSION = '0.0.1'
    MAX_SUPPORTED_VERSION = '1.2.3'

    attr_accessor :version
  end

  class_methods do
  end

  def initialize(version:)
    raise Exception, 'version is required' unless version.present?

    self.version = version
  end

  def call
    raise NotImplementedError, 'Api Version not supported for this version'
  end

  def version_at_least?(low_bound)
    low_bound <= version
  end

  def version_at_most?(high_bound)
    version <= high_bound
  end

  def version_between?(low_bound, high_bound)
    version_at_least?(low_bound) && version_at_most?(high_bound)
  end

  def min_version
    Semantic::Version.new(MIN_SUPPORTED_VERSION)
  end

  def max_version
    Semantic::Version.new(MAX_SUPPORTED_VERSION)
  end
end
