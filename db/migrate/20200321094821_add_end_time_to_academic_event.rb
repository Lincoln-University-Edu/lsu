class AddEndTimeToAcademicEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_events, :end_time, :datetime
  end
end
