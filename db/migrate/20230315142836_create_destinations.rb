# frozen_string_literal: true

class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :title
      t.text :detail
      t.references :tour, null: false, foreign_key: true
      t.integer :stay_days

      t.timestamps
    end
  end
end
