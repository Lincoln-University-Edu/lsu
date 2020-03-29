class Event < ApplicationRecord
  validates :start_time, :end_time, :name, :description, :location, :price, :external_link, :event_keywords, :event_category, presence: true
  belongs_to :entity
  has_many :keywordings, as: :keywordable, dependent: :destroy
  has_many :keywords, through: :keywordings
  has_one :categorizing, as: :categorizable
  has_one :category, through: :categorizing
  
  def event_keywords=(keywords)
    if keywords
      self.keywords = keywords.split(',').map do |keyword|
        keyword = Keyword.where(name: keyword.strip).first_or_create!
      end
    end
  end

  def event_keywords
    self.keywords.map(&:name)
  end


  def event_category=(category)
    self.category = Category.where(name: category).first_or_create!
  end

  def event_category
    if self.category
      self.category.name
    end
  end
end
