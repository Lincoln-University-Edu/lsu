class ChangeUserClassToStudentClassOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_class, :student_class
  end
end
