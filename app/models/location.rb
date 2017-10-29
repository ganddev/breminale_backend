class Location < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :user, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :name, presence: true
  validates :image_url, presence: true
end
