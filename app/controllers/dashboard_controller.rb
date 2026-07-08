class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @client_users = current_user.client_users.order(created_at: :desc).limit(10)
  end
end