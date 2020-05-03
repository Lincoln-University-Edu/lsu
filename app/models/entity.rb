class Entity < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name

  validates :name, :description, :email, :phone_number, :location, presence: true
  has_many :organizations, dependent: :destroy
  has_many :users, through: :organizations
  has_many :events

  has_many :social_accountings, as: :social_accountable
  has_many :social_accounts, through: :social_accountings

  def event_social_accounts=(accounts)
    self.social_accounts = accounts.each do |account|
      SocialAccount.where(type: account[:type], detail: account[:detail]).first_or_create!()
    end
  end

  def event_social_accounts
    self.social_accounts
  end
end
