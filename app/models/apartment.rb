class Apartment < ApplicationRecord
  mount_uploader :upload_photos, PhotoUploader

  belongs_to :user
end
