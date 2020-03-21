class ChangeDateTimeToStartTimeOnAcademicEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :academic_events, :datetime, :start_time
  end
end
