class CreateServiceRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :service_requests do |t|
      t.string :name
      t.string :phone
      t.integer :no_of_night_stays
      t.string :email
      t.text :detail
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
