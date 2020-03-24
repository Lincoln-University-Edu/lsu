require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:external_link) }
  it { should validate_presence_of(:event_keywords) }
  it { should belong_to(:entity) }
  it { should have_one(:categorizing) }
  it { should have_one(:category) }
end