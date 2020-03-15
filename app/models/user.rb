class User < ApplicationRecord
  validates :first_name, :last_name, :email,:password, presence: true
  has_secure_password
  has_many :majorings, dependent: :destroy
  has_many :majors, through: :majorings
  has_many :organizations, dependent: :destroy
  has_many :entities, through: :organizations

  def all_majors=(majors)
    self.majors = majors.map do |major|
      Major.where(name: major.strip).first_or_create!
    end
  end

  def all_majors
    self.majors.map(&:name)
  end
end
