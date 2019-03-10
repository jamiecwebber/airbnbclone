class Apartment < ApplicationRecord
  mount_uploader :upload_photos, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :category, :name, :description, :address, presence: true, allow_blank: false

  include PgSearch
  pg_search_scope :global_search,
    against: [:price_per_day, :name, :address, :category, :description],
    associated_against: {
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

  monetize :price_cents
end
