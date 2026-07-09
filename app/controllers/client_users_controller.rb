class ClientUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client_user, only: [:show, :edit, :update, :destroy]

  def index
    @client_users = current_user.client_users.order(created_at: :desc).limit(10)
  end

  def show
  end

  def new
    @client_user = current_user.client_users.build
  end

  def create
    @client_user = current_user.client_users.build(client_user_params)
    if @client_user.save
      redirect_to client_users_path, notice: "Client user created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @client_user.update(client_user_params)
    if @client_user.save
      redirect_to client_users_path, notice: "Client user updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client_user.destroy

    respond_to do |format|
      format.html { redirect_to client_users_path, notice: "El usuario ha sido borrado con éxito.", status: :see_other }
      format.turbo_stream { flash.now[:notice] = "El usuario ha sido borrado con éxito." }
    end
  end

  private

  def client_user_params
    params.require(:client_user).permit(:name, :rfc, :address, :phone, :website, :user_id, :is_admin)
  end

  def set_client_user
    @client_user = current_user.client_users.find(params[:id])
  end
end