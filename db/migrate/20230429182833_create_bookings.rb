class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :no_of_persons
      t.string :email
      t.string :stay_nights
      t.string :phone
      t.text   :detail
      t.datetime :departure_date
      t.datetime :return_date
      t.references :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
