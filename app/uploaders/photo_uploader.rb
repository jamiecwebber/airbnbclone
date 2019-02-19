class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumbnail do
    resize_to_fit 200, 200
  end

  version :large_image do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 1500, height: 1500, crop: :thumb, gravity: :face
  end
end
