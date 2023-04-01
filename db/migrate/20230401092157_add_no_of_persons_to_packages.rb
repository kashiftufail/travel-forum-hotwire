# frozen_string_literal: true

class AddNoOfPersonsToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :no_of_persons, :integer
  end
end
