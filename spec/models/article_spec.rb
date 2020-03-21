require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of(:author_name) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:cover_image) }
  it { should validate_presence_of(:category) }
end