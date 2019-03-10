class AddSkuToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :sku, :string
  end
end
