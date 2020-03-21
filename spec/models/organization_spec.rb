require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:entity) }
end
