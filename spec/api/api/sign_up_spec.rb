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

  context 'User already exists' do
    let(:user) { create :user }
    let(:params) do
      {
        email: user.email,
        password: 'mafsdfa',
        password_confirmation: 'mafsdfa'
      }
    end

    it 'returns http status code 400' do
      post '/sign_up', params: params, headers: nil
      expect(response).to have_http_status(400)
    end
  end
end
