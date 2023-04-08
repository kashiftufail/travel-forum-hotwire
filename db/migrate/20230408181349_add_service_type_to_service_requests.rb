class AddServiceTypeToServiceRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :service_requests, :service_type, :string
  end
end
