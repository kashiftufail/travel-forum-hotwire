class CreateAddresses < ActiveRecord::Migration[7.0]
  def change    
    create_table :addresses do |t| 
      t.integer :addressable_id,    null: false 
      t.string  :addressable_type,  null: false 
      t.string  :addressable_scope, null: false
      t.string  :address_name
      t.string  :street_first_line, null: false
      t.string  :street_second_line
      t.string  :postal_code,       null: false
      t.string  :city,              null: false
      t.string  :province,          null: false
      t.string  :country,           null: false
  
      t.timestamps
    end
  
    add_index :addresses, 
                [:addressable_id, 
                 :addressable_type, 
                 :addressable_scope], 
                name: 'addressable_index'
  end
end
