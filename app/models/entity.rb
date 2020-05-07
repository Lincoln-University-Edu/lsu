class Entity < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name

  scope :organization, -> { where('is_organization == ?', true) }
  scope :office, -> { where('is_office == ?', true) }

  validates :name, :description, :email, :phone_number, :location, presence: true
  has_many :organizations, dependent: :destroy
  has_many :users, through: :organizations
  has_many :events

  has_many :social_accountings, as: :social_accountable
  has_many :social_accounts, through: :social_accountings

  has_one :imaging, as: :imageable
  has_one :image, through: :imaging

  def entity_social_accounts=(accounts)
    self.social_accounts = accounts.each do |account|
      social_type = account[:social_type]
      social_detail = account[:detail]
      return SocialAccount.where(social_type: social_type).where(detail: social_detail).first_or_create!
    end
  end

  def entity_social_accounts
    self.social_accounts
  end

  def entity_image=(entity_image)
    self.image = Image.where(url: entity_image).first_or_create!
  end

  def entity_image
    self.image.try(:url)
  end
end
