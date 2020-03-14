require 'rails_helper'

RSpec.describe Keywording, type: :model do
  it { should belong_to(:keywordable) }
  it { should belong_to(:keyword) }
end
