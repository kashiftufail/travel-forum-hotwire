class ChangeRefernceTypeInPackages < ActiveRecord::Migration[7.0]
  def change       
    remove_reference :packages, :tour, foreign_key: true, index: true 
  end
end
