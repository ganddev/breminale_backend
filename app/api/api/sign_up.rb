module API
  class SignUp < Grape::API
    resource :sign_up do
      desc 'Signs up a user' do
      end
      params do
        requires :email, type: String, desc: 'Email of the user'
        requires :password, type: String, desc: 'Password'
        requires :password_confirmation, type: String, desc: 'Password confirmation'
      end
      post '/' do
        user = User.find_by(email: params[:email])
        error!("[400] User with email already exists",400) if user
        User.create(params)
        token = TokenProvider.issue_token(user)
        {token: token}
      end
    end
  end
end