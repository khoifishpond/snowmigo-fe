class ApplicationController < ActionController::Base
  helper_method :current_user
  # before_action :require_user

  private

  def current_user
    @current_user ||= UserFacade.user_get(session[:user_id]) if session[:user_id]
  end

  # def require_user
  #   permission_denied unless current_user
  # end
  #
  # def permission_denied
  #   redirect_to root_path, alert: 'Please login or create an account.'
  # end
end
