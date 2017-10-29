require 'rails_helper'

describe API::Events, type: :request do

  describe 'GET /events' do
    before do
      create(:event)
    end

    it 'returns list of events' do
      get '/events', headers: headers
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema('events/list')
    end
  end

  describe 'GET /events/id' do
    let(:event) { create(:event) }

    it 'returns requested event' do
      get "/events/#{event.id}", headers: headers
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema('events/event')
    end

    it 'returns 404 when event not exists' do
      get "/events/#{event.id+1}", headers: headers
      expect(response).to have_http_status(404)
    end
  end
end
