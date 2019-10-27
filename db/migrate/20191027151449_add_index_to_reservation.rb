class AddIndexToReservation < ActiveRecord::Migration[6.0]
  def change
  	add_reference :reservations, :listing, foreign_key: true
  end
end
