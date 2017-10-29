module API
  module Entities
    class Event < Grape::Entity
      expose :id, :name, :description, :location_id, :start_time, :sound_cloud_url, :sound_cloud_user_id, :archived
    end
  end
end
