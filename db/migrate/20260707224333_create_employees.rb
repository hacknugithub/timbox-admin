class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :rfc
      t.text :tax_address_ciphertext
      t.text :curp_ciphertext
      t.text :nss_ciphertext
      t.datetime :started_working_at
      t.integer :contract_type, default: 0
      t.integer :department
      t.string :position
      t.decimal :daily_salary
      t.decimal :monthly_salary
      t.string :entity
      t.integer :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
