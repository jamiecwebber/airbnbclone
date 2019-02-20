class AddBookingsReferencesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :bookings, index:true
  end
end
