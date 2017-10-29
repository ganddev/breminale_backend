module API
  class API < Grape::API
    format :json

    get '/' do
      { version: `git rev-parse --short HEAD`.strip }
    end

    # route listing
    mount API::Locations
    mount API::Events
    mount API::SignUp

    add_swagger_documentation(
      mount_path: '/swagger_doc',
      security_definitions: {
        api_key: {
          type: 'apiKey',
          name: 'Authorization',
          in: 'header'
        }
      },
      security: [
        { api_key: [] }
      ]
    )
  end
end
