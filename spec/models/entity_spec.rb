require 'rails_helper'

RSpec.describe Entity, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:location) }
  it { should have_many(:events) }
  it { should have_many(:social_accountings) }
  it { should have_many(:social_accounts).through(:social_accountings) }
  it { should have_one(:imaging) }
  it { should have_one(:image).through(:imaging) }
end