require 'rails_helper'

RSpec.describe Categorizing, type: :model do
  it { should belong_to(:category) }
  it { should belong_to(:categorizable) }
end
