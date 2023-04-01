# frozen_string_literal: true

class AddSlugToPackage < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :slug, :string
    add_index :packages, :slug, unique: true
  end
end
