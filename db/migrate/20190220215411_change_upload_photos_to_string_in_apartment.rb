class ChangeUploadPhotosToStringInApartment < ActiveRecord::Migration[5.2]
  def change
    change_column :apartments, :upload_photos, :string
  end
end
