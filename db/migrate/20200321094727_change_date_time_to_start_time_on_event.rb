class ChangeDateTimeToStartTimeOnEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :datetime, :start_time
  end
end
