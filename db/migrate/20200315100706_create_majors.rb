class CreateMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :majors do |t|
      t.string :name

      t.timestamps
    end
  end
end
