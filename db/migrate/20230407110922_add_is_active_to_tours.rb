class AddIsActiveToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :is_active, :boolean , default: true    
  end
end
