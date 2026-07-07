class AddCustomFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rfc, :string, null: false, default: "XAXX010101000"
  end
end
