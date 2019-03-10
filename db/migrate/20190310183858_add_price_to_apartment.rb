class AddPriceToApartment < ActiveRecord::Migration[5.2]
  def change
    add_monetize :apartments, :price, currency: { present: false }
  end
end
