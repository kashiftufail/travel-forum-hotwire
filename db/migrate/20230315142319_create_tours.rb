# frozen_string_literal: true

class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :title
      t.text :detail
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
