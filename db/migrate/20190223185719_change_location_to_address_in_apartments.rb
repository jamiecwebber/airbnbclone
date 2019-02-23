class ChangeaddressToAddressInApartments < ActiveRecord::Migration[5.2]
  def change
    rename_column :apartments, :address, :address
  end
end
