require 'rails_helper'

RSpec.describe StudentWire, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:contact) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:cover_image) }
  it { should validate_presence_of(:external_link) }
  it { should validate_presence_of(:student_wire_keywords) }
end