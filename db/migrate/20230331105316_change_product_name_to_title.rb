# frozen_string_literal: true

class ChangeProductNameToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :name, :title
  end
end
