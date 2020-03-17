class Event < ApplicationRecord
  validates :datetime, :name, :description, :location, :price, :external_link, :event_keywords, presence: true
  belongs_to :entity
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings

  def event_keywords=(keywords)
    self.keywords = keywords.split(',').map do |keyword|
      keyword = Keyword.where(name: keyword.strip).first_or_create!
    end
  end

  def event_keywords
    self.keywords.map(&:name)
  end
end
