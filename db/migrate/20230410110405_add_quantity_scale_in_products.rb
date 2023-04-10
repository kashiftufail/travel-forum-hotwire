class AddQuantityScaleInProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :quantity_scale, :string
  end
end
