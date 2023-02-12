module ApproachG::Versioned::Head
  extend ActiveSupport::Concern

  attr_accessor :version

  def initialize(*args, version:, **kwargs)
    self.version = version
    raise Exception, 'version is required' unless version.present?

    super(*args, **kwargs)
  end
end
