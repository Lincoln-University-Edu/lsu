require 'rails_helper'

RSpec.describe AcademicEvent, type: :model do
  it { should validate_presence_of(:datetime) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
end