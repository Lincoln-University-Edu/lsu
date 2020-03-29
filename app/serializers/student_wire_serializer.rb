class StudentWireSerializer < ActiveModel::Serializer
  attributes :id, :contact, :title, :body, :cover_image, :external_link, :student_wire_keywords
end
