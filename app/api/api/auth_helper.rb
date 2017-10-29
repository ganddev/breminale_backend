module API
  module AuthHelper
    def current_user
      @current_user ||= User.find_by(id: decoded_token.user_id)
    end

    private

    def decoded_token
      @decoded_token ||= OpenStruct.new(TokenProvider.decode(token).first)
    end

    def token
      headers['Authorization']
    end
  end
end
