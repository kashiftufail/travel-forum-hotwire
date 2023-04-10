class CreateDestinationsPackages < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations_packages do |t|
      t.references :destination, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
