class ChangeNameToFirstNameAndLastNameOnUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    add_column :users, :first_name, :string, default: "", null: false
    add_column :users, :last_name, :string, default: "", null: false
  end
end
