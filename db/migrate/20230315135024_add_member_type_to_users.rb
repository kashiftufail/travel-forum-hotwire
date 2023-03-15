class AddMemberTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :member_type, :integer , default: 0, null: false 
  end
end
