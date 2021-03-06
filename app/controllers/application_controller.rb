class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      "/home/admin"
    else
      "/home/developer"
    end
  end
end
