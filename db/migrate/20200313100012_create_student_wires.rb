class CreateStudentWires < ActiveRecord::Migration[6.0]
  def change
    create_table :student_wires do |t|
      t.string :contact
      t.string :title
      t.string :body
      t.string :cover_image
      t.string :external_link

      t.timestamps
    end
  end
end
