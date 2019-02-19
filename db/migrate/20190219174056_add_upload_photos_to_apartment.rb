class AddUploadPhotosToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :upload_photos, :string
  end
end
