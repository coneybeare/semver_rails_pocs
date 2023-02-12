class Api::ApproachB::VersionedController < ApplicationController
  before_action :load_version

  protected

  attr_accessor :version

  def load_version
    requested_version = params.delete(:version)
    self.version = Semantic::Version.new(requested_version)
  end
end
