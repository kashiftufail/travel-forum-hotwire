class CreateBookingsDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings_destinations do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
