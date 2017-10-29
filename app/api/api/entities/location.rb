module API
  module Entities
    class Location < Grape::Entity
      expose :id, :name, :latitude, :longitude, :description, :archived
    end
  end
end