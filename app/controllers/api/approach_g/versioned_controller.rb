class Api::ApproachG::VersionedController < ApplicationController
  before_action :load_version

  protected

  attr_accessor :version

  def load_version
    requested_version = params.delete(:version)
    self.version = Semantic::Version.new(requested_version)
  end

  rescue_from(NotImplementedError) do
    render json: "{errors: [{'code': 'unsupported_version', 'details': 'API Version #{version} not supported.'}]}",
           status: 422
  end
end
