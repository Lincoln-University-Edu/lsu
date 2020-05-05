require 'rails_helper'

RSpec.describe SocialAccount, type: :model do
  it { should validate_presence_of(:detail) }
  it { should validate_presence_of(:social_type) }
  it { should have_one(:social_accounting) }
end
