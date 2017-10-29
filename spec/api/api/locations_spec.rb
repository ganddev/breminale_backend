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

  describe 'POST /location' do
    let(:params) do
      {
        name: 'Test location',
        description: 'My test desc.',
        latitude: 54.13,
        longitude: 8.12,
        image_url: 'path/to/image.jpg'
      }
    end

    user_authenticated

    before do
      post '/locations', params: params, headers: @headers
    end

    context 'valid params' do
      it 'returns with http status created' do
        expect(response).to have_http_status(:created)
      end

      it 'return matches schema' do
        expect(response).to match_response_schema('locations/location')
      end

      it 'adds a location' do
        expect do
          post '/locations', params: params, headers: @headers
        end.to change(Location, :count).by(1)
      end
    end

    context 'latitude is missing' do
      let(:params) do
        {
          name: 'Test location',
          description: 'My test desc.',
          longitude: 8.12,
          image_url: 'path/to/image.jpg'
        }
      end

      it 'returns with an error' do
        expect(response).to have_http_status(400)
      end
    end

    context 'longitude is missing' do
      let(:params) do
        {
          name: 'Test location',
          description: 'My test desc.',
          latitude: 8.12,
          image_url: 'path/to/image.jpg'
        }
      end

      it 'returns with an error' do
        expect(response).to have_http_status(400)
      end
    end

    context 'name is missing' do
      let(:params) do
        {
          description: 'My test desc.',
          longitude: 53.123,
          latitude: 8.12,
          image_url: 'path/to/image.jpg'
        }
      end

      it 'returns with an error' do
        expect(response).to have_http_status(400)
      end
    end

    context 'image_url is missing' do
      let(:params) do
        {
          name: 'My test name.',
          description: 'My test desc.',
          longitude: 53.123,
          latitude: 8.12,
        }
      end

      it 'returns with an error' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
