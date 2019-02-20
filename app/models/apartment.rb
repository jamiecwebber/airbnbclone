class Apartment < ApplicationRecord
  mount_uploader :upload_photos, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
end
