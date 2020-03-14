require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let!(:events) { create_list(:event, 10) }
  let(:event) { events.first }

  describe 'GET /events' do
    it 'should return all events' do
      
    end
  end
end