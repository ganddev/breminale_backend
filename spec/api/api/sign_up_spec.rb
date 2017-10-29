require 'rails_helper'

describe API::SignUp do
  let(:params) do
    {
      email: 'test@teasdf.de',
      password: 'mafsdfa',
      password_confirmation: 'mafsdfa'
    }
  end

  context 'Valid params' do
    before do
      post '/sign_up', params: params, headers: nil
    end

    it 'returns with http status code created' do
      expect(response).to have_http_status(:created)
    end

    it 'returns with json schema' do
      expect(response).to match_response_schema('token')
    end
  end
end
