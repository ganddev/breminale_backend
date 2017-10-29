module API
  class Events < Grape::API
    resource :events do
      desc 'Return all events' do
        success Entities::Event
      end
      get '/' do
        present Event.all, with: Entities::Event
      end

      desc 'Return single event' do
        success Entities::Event
      end
      params do
        requires :id, type: Integer, desc: 'Id of the event'
      end
      get '/:id' do
        event = Event.find_by(id: params[:id])
        error!('[404] Resource not found', 404) unless event
        present event, with: Entities::Event
      end
    end
  end
end
