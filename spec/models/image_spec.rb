require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should_validate_presence_of(:url) }
end
