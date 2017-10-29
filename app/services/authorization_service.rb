class AuthorizationService
  def self.perform(email, password)
    new(email, password).perform
  end

  def initialize(email, password)
    @email = email
    @password = password
  end

  def perform
    return unless authorize?
    TokenProvider.issue_token(user)
  end

  private

  attr_reader :email, :password

  def user
    @user ||= User.find_by(email: email)
  end

  def authorize?
    user && user.authenticate(password)
  end
end
