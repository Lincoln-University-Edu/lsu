class RenameUserRoles < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_lincolnian_press_publisher, :is_lincoln_press_publisher
  end
end
