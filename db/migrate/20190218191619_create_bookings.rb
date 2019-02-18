class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :apartment, foreign_key: true
      t.string :enter_date
      t.string :exit_date
      t.integer :price_total

      t.timestamps
    end
  end
end
