class AddIndexToListingsViaCity < ActiveRecord::Migration[6.0]
  def change
  	 add_reference :listings, :city, foreign_key: true
  end
end
