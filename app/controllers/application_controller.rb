class ApplicationController < ActionController::Base
  before_action :check_single_session, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:rfc])
  end

  private

  def check_single_session
    if session[:current_session_token].blank?
      new_token = SecureRandom.hex(16)
      current_user.update_columns(current_session_token: new_token, session_created_at: Time.current)
      session[:current_session_token] = new_token
    elsif session[:current_session_token] != current_user.current_session_token
      sign_out current_user
      redirect_to new_user_session_path, alert: "Your session has expired. Please log in again."
    end
  end
end
