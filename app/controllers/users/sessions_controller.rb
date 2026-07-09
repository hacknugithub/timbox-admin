class Users::SessionsController < Devise::SessionsController
  def create
    super do |user|
      new_token = SecureRandom.hex(16)
      user.update_columns(current_session_token: new_token, session_created_at: Time.current)
      session[:current_session_token] = new_token
    end
  end
end