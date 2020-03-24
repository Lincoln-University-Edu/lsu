require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should have_one(:liking) }
end
