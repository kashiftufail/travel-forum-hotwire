class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :sub_total
      t.float :total
      t.string :shipping_address
      t.integer :payment_mod
      t.string :name
      t.string :email
      t.string :phone
      
      t.timestamps
    end
  end
end
