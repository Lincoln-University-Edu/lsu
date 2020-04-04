class AddCompletedRegistrationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :completed_registration, :boolean, null: false, default: false
  end
end
