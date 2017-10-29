require 'rails_helper'

describe TokenProvider do

  describe 'issue_token' do
    let(:user) { create :user }

    it 'creates a token for the user' do
      token  = TokenProvider.issue_token(user)
      byebug
    end
  end
end