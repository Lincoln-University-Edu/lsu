require 'rails_helper'

RSpec.describe Major, type: :model do
  it { should have_many(:majorings) }
  it { should have_many(:users) }
end
