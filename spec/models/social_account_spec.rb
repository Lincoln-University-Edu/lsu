require 'rails_helper'

RSpec.describe SocialAccount, type: :model do
  it { should have_one(:social_accounting) }
end
