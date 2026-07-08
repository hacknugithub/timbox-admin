class AccountSettingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_account_settings_path, notice: "Configuración de cuenta actualizada exitosamente."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end