class AddDestinationsCountToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :destinations_count, :integer
    Tour.find_each do |t|
      Tour.reset_counters(t.id, :destinations)
    end
  end
end
