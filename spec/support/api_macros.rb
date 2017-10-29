module ApiMacros
  def user_authenticated
    before do
      user = create :user
      @headers = { Authorization: TokenProvider.issue_token(user) }
    end
  end
end
