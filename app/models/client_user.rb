class ClientUser < ApplicationRecord
  belongs_to :user

  validates :name, :rfc, :address, :phone, :website, presence: true
  validates :rfc, uniqueness: { message: "ya existe en el sistema" }, format: { with: /\A[A-Z0-9]{13}\z/, message: "debe tener exactamente 13 caracteres alfanuméricos" }
  validates :phone, format: { with: /\A\d{10}\z/, message: "debe tener exactamente 10 dígitos" }
  validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "no tiene un formato válido" }
end
