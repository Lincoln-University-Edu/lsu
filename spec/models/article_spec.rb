require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of(:author_name) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:cover_image) }
  it { should have_one(:categorizing) }
  it { should have_one(:category) }
  it { should have_many(:likings) }
  it { should have_many(:likes) }
end