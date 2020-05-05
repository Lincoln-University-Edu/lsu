class SocialAccount < ApplicationRecord
  has_one :social_accounting
  has_one :social_accountable, through: :social_accounting

  validates :social_type, :detail, presence: true
end
