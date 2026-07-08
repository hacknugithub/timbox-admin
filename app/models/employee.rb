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

end
