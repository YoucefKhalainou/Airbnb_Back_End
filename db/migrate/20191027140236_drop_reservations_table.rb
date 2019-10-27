class DropReservationsTable < ActiveRecord::Migration[6.0]
   def up
    drop_table :reservations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
