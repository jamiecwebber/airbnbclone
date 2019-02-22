class Apartment < ApplicationRecord
  mount_uploader :upload_photos, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :price_per_day, :category, :name, :description, :location, presence: true, allow_blank: false

  include PgSearch
  pg_search_scope :global_search,
    against: [:price_per_day, :name, :location, :category, :description],
    associated_against: {
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
