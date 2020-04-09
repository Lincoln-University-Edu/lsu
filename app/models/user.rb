class User < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_term, against: [ :email, :first_name, :last_name ]

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  
  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  has_secure_password
  has_many :majorings, dependent: :destroy
  has_many :majors, through: :majorings
  has_many :organizations, dependent: :destroy
  has_many :entities, through: :organizations
  has_many :promotions, dependent: :destroy
  has_many :keywordings, as: :keywordable
  has_many :keywords, through: :keywordings

  def all_majors=(majors)
    self.majors = majors.split(',').map do |major|
      Major.where(name: major.strip).first_or_create!
    end
  end

  def all_majors
    self.majors.map(&:name)
  end

  def user_keywords=(keywords)
    if keywords
      self.keywords = keywords.split(",").map do |keyword|
        Keyword.where(name: keyword.strip).first_or_create!
      end
    end
  end

  def user_keywords
    self.keywords.map(&:name)
  end

  def user_entities=(entities)
    if entities
      self.entities = entities.split(",").map do |entity|
        Entity.where(name: entity.strip).first_or_create!
      end
    end
  end

  def user_entities
    self.entities.map(&:name)
  end
end
