class AccountSettingsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update]

  def show
  end
  
  def edit
  end

  def update
    if account_settings_params[:password].present?
      updated = @user.update_with_password(account_settings_params)
    else
      clean_params = account_settings_params.except(:password, :password_confirmation, :current_password)
      updated = @user.update_without_password(clean_params)
    end

    if updated
      bypass_sign_in(@user)
      redirect_to edit_account_settings_path, notice: "Configuración de cuenta actualizada exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def account_settings_params
    params.require(:user).permit(
      :email, 
      :rfc, 
      :current_password, 
      :password, 
      :password_confirmation
    )
  end
end