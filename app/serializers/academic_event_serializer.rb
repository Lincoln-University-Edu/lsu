class AcademicEventSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :name, :description, :location
end
