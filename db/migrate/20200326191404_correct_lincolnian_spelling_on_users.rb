class CorrectLincolnianSpellingOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_lincolian_press_publisher, :is_lincolnian_press_publisher
    rename_column :users, :is_lincolian_publisher, :is_lincolnian_publisher
  end
end
