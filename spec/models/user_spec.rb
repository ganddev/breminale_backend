require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    let(:valid_params) do
      attributes_for(:user).merge(
        email: 'test@test.de',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    let(:user) { User.new(user_params) }

    context 'email is not given' do
      let(:user_params) { valid_params.merge(email: nil) }

      it 'is invalid' do
        expect(user).to be_invalid
        expect(user.errors.keys).to eq %i[email]
      end
    end

    context 'password is nil' do
      let(:user_params) { valid_params.merge(password: nil) }

      it 'is invalid' do
        expect(user).to be_invalid
        expect(user.errors.keys).to eq %i[password password_confirmation]
      end
    end

    context 'password_confirmation is different' do
      let(:user_params) { valid_params.merge(password_confirmation: 'aa') }

      it 'is invalid' do
        expect(user).to be_invalid
        expect(user.errors.keys).to eq %i[password_confirmation]
      end
    end

    context 'password is to short' do
      let(:user_params) { valid_params.merge(password: 'aa') }

      it 'is invalid' do
        expect(user).to be_invalid
        expect(user.errors.keys).to eq %i[password_confirmation]
      end
    end
  end
end