require 'rails_helper'

describe TokenProvider do
  let(:provider) { described_class }

  describe 'issue_token' do
    let(:user) { create :user }

    it 'creates a token for the user' do
      expect(provider.issue_token(user)).not_to be_nil
    end
  end

  describe 'valid?' do
    context 'valid token' do
      let(:user) { create :user }
      let(:token) { provider.issue_token(user) }

      it 'is valid' do
        expect(provider).to be_valid(token)
      end
    end

    context 'invalid token' do
      let(:token) { 'Meintest' }

      it 'is invalid' do
        expect(provider).not_to be_valid(token)
      end
    end
  end
end
