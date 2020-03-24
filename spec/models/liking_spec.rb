require 'rails_helper'

RSpec.describe Liking, type: :model do
  it { should belong_to(:like) }
  it { should belong_to(:likeable) }

end
