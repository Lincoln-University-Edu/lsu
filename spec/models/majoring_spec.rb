require 'rails_helper'

RSpec.describe Majoring, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:major) }
end
