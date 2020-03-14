class AcademicEvent < ApplicationRecord
  validates :datetime, :name, :description, :location, presence: true
end
