class Employee < ApplicationRecord
  include Stetable
  belongs_to :user
  has_encrypted :curp, :nss, :tax_address

  enum contract_type: { indefinite: 0, temporary: 1, training: 2, seasonal: 3 }
  enum department: {
    administration: 0,
    accounting: 1,
    human_resources: 2,
    sales: 3,
    marketing: 4,
    production: 5,
    logistics: 6,
    quality_control: 7
  }

  validates :name, :email, :rfc, :tax_address, :curp, :nss, :started_working_at, :position, :daily_salary, :monthly_salary, :contract_type, :department, :state, presence: true
  validates :email, uniqueness: { message: "ya existe en el sistema" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "no tiene un formato válido" }
  validates :rfc, uniqueness: { message: "ya existe en el sistema" }, format: { with: /\A[A-Z0-9]{13}\z/, message: "debe tener exactamente 13 caracteres alfanuméricos" }
  validates :curp, format: { with: /\A[A-Z0-9]{18}\z/, message: "debe tener exactamente 18 caracteres alfanuméricos" }
  validates :nss, format: { with: /\A\d{11}\z/, message: "debe tener exactamente 11 dígitos" }
end
