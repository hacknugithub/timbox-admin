class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @employees = current_user.employees.order(created_at: :desc).limit(10)
  end
end