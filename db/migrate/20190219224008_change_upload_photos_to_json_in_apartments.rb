class ChangeUploadPhotosToJsonInApartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :upload_photos
    add_column :apartments, :upload_photos, :json
  end
end
