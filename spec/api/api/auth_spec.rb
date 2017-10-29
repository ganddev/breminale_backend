require 'rails_helper'

describe API::Auth do
  let(:user) { create :user }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end

  context 'User exists and email and password are correct' do
    before do
      post '/auth/session', params: params, headers: nil
    end
    it 'returns a with succes http status' do
      expect(response).to have_http_status(:success)
    end

    it 'matches schema' do
      expect(response).to match_response_schema('token')
    end
  end

  context 'User exists but password is incorrect' do
    let(:params) do
      {
        email: user.email,
        password: user.password + ' wrong'
      }
    end

    it 'returns unauthorized' do
      post '/auth/session', params: params, headers: nil
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'User does not exists' do
    let(:params) do
      {
        email: 'Do not exist',
        password: ' wrong'
      }
    end

    it 'returns unauthorized' do
      post '/auth/session', params: params, headers: nil
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
