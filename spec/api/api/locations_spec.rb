require 'rails_helper'

describe API::Locations, type: :request do
  describe 'GET /locations' do
    before do
      create(:location)
    end

    it 'returns list of events' do
      get '/locations', headers: headers
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema('locations/list')
    end
  end

  describe 'GET /locations/id' do
    let(:location) { create(:location) }

    it 'returns requested event' do
      get "/locations/#{location.id}", headers: headers
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema('locations/location')
    end

    it 'returns 404 when event not exists' do
      get "/locations/#{location.id + 1}", headers: headers
      expect(response).to have_http_status(404)
    end
  end
end
