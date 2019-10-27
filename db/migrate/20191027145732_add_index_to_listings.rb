class AddIndexToListings < ActiveRecord::Migration[6.0]
  def change
  	add_reference :listings, :admin, foreign_key: { to_table: :users }
  end
end
