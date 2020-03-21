require 'rails_helper'

RSpec.describe Entity, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:location) }
  it { should have_many(:events) }
end