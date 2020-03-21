class AddLocationToAcademicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_events, :location, :string
  end
end
