module API
  class Locations < Grape::API
    resource :locations do
      desc 'Return all locations' do
        success Entities::Location
      end
      get '/' do
        present Location.all, with: Entities::Location
      end

      desc 'Creates a single location' do
        success Entities::Location
      end
      params do
        requires :name, type: String, desc: 'Name for the location'
        optional :description, type: String, desc: 'Description for the location'
        requires :latitude, type: Float, desc: 'Latitude for the location'
        requires :longitude, type: Float, desc: 'Latitude for the location'
        requires :image_url, type: String, desc: 'Path to image for the location'
      end
      post '/' do
        location = current_user.locations.create(params)
        error!("['422'] Unprocessable entity", 422) unless location.persisted?
        present location, with: Entities::Location
      end
      desc 'Returns a single location for given id' do
        success Entities::Location
      end
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        location = Location.find_by(id: params[:id])
        error!("['404'] Resource not found", 404) unless location
        present location, with: Entities::Location
      end
    end
  end
end
