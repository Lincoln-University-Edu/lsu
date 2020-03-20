class User < ApplicationRecord
  validates :first_name, :last_name, :email,:password, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :majorings, dependent: :destroy
  has_many :majors, through: :majorings
  has_many :organizations, dependent: :destroy
  has_many :entities, through: :organizations
  has_many :promotions

  def all_majors=(majors)
    self.majors = majors.split(',').map do |major|
      Major.where(name: major.strip).first_or_create!
    end
  end

  def all_majors
    self.majors.map(&:name)
  end
end
