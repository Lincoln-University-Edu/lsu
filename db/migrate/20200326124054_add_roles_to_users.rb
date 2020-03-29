class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_lincolian_press_publisher, :boolean, null: false, default: false
    add_column :users, :is_lincolian_publisher, :boolean, null: false, default: false
    add_column :users, :is_student_wire_editor, :boolean, null: false, default: false
    add_column :users, :is_student_life_event_publisher, :boolean, null: false, default: false
    add_column :users, :is_academic_event_publisher, :boolean, null: false, default: false
    add_column :users, :is_athletic_event_publisher, :boolean, null: false, default: false
  end
end
