class Apartment < ApplicationRecord
  mount_uploader :upload_photos, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :price_per_day, :category, :name, :description, :location, :photos, presence: true
end
