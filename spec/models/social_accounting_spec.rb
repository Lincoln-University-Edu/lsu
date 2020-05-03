require 'rails_helper'

RSpec.describe SocialAccounting, type: :model do
  it { should belong_to(:social_account) }
  it { should belong_to(:social_accountable) }
end
