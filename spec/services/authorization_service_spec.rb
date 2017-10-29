require 'rails_helper'

describe AuthorizationService do
  let(:service) { described_class.new(email, password) }
  let(:email) { 'mytest@email.de' }
  let(:password) { 'my_password' }

  context 'When user does not exists' do
    it 'Returns nil as result' do
      expect(service.perform).to be_nil
    end

    it 'does not calls the token provider' do
      allow(TokenProvider).to receive(:issue_token)
      service.perform
      expect(TokenProvider).not_to have_received(:issue_token)
    end
  end

  context 'When user exists' do
    let(:user) { create :user }
    let(:email) {user.email}
    let(:password) {user.password}

    it 'Returns a token' do
      expect(service.perform).not_to be_nil
    end

    it 'Calls the token provider' do
      allow(TokenProvider).to receive(:issue_token)
      service.perform
      expect(TokenProvider).to have_received(:issue_token)
    end
  end

  context 'When password is wrong' do
    it 'Returns nil as result' do
      expect(service.perform).to be_nil
    end

    it 'does not call the token provider' do
      allow(TokenProvider).to receive(:issue_token)
      service.perform
      expect(TokenProvider).not_to have_received(:issue_token)
    end
  end
end
