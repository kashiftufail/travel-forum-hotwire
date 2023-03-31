class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :number
      t.references :category, null: false, foreign_key: true
      t.float :price
      t.integer :quantity_in_hand
      t.text :detail
      t.string :size
      t.string :slug
      
      t.timestamps
    end
    add_index :products , :slug , unique: true
  end
end
