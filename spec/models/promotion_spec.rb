require 'rails_helper'

RSpec.describe Promotion, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:condition) }
end