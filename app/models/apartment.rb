class Apartment < ApplicationRecord
  mount_uploader :photos, PhotoUploader

  belongs_to :user
end
