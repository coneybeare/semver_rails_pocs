class ApplicationController < ActionController::API
  def params
    super.permit!.except(:controller, :action)
  end
end
