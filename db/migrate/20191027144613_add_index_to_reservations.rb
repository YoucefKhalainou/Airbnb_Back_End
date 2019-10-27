class AddIndexToReservations < ActiveRecord::Migration[6.0]
  def change
  	 add_reference :reservations, :guest, foreign_key: { to_table: :users }
  end
end
