class AddUploadPhotosToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :upload_photos, :string
  end
end
