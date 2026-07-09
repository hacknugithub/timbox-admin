class CreateClientUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :client_users do |t|
      t.string :name
      t.string :rfc
      t.string :address
      t.string :phone
      t.string :website
      t.references :user, null: false, foreign_key: true
      t.boolean :is_admin, default: false, null: false

      t.timestamps
    end
  end
end
