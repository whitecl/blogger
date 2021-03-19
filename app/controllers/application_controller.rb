class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :ensure_current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def ensure_current_user
    redirect_to login_path unless current_user
  end
end
