class AcademicEvent < ApplicationRecord
  default_scope { order( start_time: :asc ) }


  include PgSearch::Model
  pg_search_scope :search_by_term, against: [ :name, :description, :location, :start_time, :end_time ]
  
  validates :start_time, :end_time, :name, :description, :location, presence: true
end
