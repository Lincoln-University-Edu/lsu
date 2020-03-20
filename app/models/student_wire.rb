class StudentWire < ApplicationRecord
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings
  validates :contact, :title, :body, :cover_image, :external_link, :student_wire_keywords, presence: true

  def student_wire_keywords=(keywords)
    if keywords
      self.keywords = keywords.split(",").map do |keyword|
        Keyword.where(name: keyword.strip).first_or_create!
      end
    end
  end

  def student_wire_keywords
    self.keywords.map(&:name)
  end
end
