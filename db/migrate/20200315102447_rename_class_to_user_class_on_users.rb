class RenameClassToUserClassOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :class, :user_class   
  end
end
