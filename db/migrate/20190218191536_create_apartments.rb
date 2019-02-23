class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.references :user, foreign_key: true
      t.integer :price_per_day
      t.string :category
      t.string :name
      t.string :description
      t.string :address
      t.string :photos

      t.timestamps
    end
  end
end
