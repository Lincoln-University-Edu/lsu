class SocialAccounting < ApplicationRecord
  belongs_to :social_account
  belongs_to :social_accountable, polymorphic: true
end
