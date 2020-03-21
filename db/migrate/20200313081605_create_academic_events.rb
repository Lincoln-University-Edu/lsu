class CreateAcademicEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_events do |t|
      t.datetime :datetime
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
