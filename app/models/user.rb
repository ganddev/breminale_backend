class User < ApplicationRecord
  has_secure_password
  has_many :locations
  has_many :events

  validates :email, presence: true
  validates :email, uniqueness: true

  validates_confirmation_of :password
end
