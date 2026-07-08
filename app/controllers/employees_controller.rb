class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = current_user.employees.order(created_at: :desc).limit(10)
  end

  def new
    @employee = Employee.new
  end

  def create 
    @employee = current_user.employees.build(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee created successfully."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @employee.update_columns(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @employee.delete
    redirect_to employees_path, notice: "Employee deleted successfully."
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :rfc, :tax_address, :curp, :nss, :started_working_at, :contract_type, :department, :position, :daily_salary, :monthly_salary, :entity, :state)
  end

  def set_employee
    @employee = Employee.find(employee_id)
  end
end
