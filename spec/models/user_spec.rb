require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:majors) }
  it { should have_many(:majorings) }
  it { should have_many(:organizations) }
  it { should have_many(:entities) }
end