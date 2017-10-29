class Event < ApplicationRecord
  belongs_to :location
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :location
  validates_presence_of :name
  validates_presence_of :start_time
end
