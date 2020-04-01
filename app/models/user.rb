class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  
  validates :first_name, :last_name, :email, :password, presence: true
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
end
