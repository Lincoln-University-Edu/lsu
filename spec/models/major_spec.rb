require 'rails_helper'

RSpec.describe Major, type: :model do
  it { validate_presence_of(:name) }
  it { should have_many(:majorings) }
  it { should have_many(:students) }
end
