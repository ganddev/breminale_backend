module API
  class Auth < Grape::API
    resource :auth do
      desc 'Authorize user and return JWT token' do
      end
      params do
        requires :email, type: String, desc: 'Email adress of user', allow_blank: false
        requires :password, type: String, desc: 'Password of the user', allow_blank: false
      end
      post '/session' do
        token = AuthorizationService.perform(params[:email], params[:password])
        error!("['401'] Unauthorized user might not exists", :unauthorized) unless token
        { token: token }
      end
    end
  end
end
