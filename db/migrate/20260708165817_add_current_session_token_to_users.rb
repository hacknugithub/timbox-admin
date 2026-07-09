class AddCurrentSessionTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :current_session_token, :string
    add_column :users, :session_created_at, :datetime
  end
end
