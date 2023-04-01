# frozen_string_literal: true

class AddSlugToToursAndDestinations < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :slug, :string, null: false
    add_column :destinations, :slug, :string, null: false
    add_index :tours, :slug, unique: true
    add_index :destinations, :slug, unique: true
  end
end
