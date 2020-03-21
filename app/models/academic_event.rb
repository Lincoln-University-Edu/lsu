class AcademicEvent < ApplicationRecord
  validates :start_time, :end_time, :name, :description, :location, presence: true
end
