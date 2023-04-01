# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :title
      t.references :tour, null: false, foreign_key: true
      t.float :price
      t.text :detail

      t.timestamps
    end
  end
end
