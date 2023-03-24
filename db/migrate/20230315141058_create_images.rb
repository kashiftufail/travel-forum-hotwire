# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :alt_text
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
