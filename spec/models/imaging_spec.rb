require 'rails_helper'

RSpec.describe Imaging, type: :model do
  it { should belong_to(:imageable) }
  it { should belong_to(:image) }
end
