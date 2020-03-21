class AddEndTimeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :end_time, :datetime
  end
end
