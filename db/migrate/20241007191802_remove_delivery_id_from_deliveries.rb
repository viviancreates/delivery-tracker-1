class RemoveDeliveryIdFromDeliveries < ActiveRecord::Migration[7.1]
  def change
    remove_column :deliveries, :delivery_id, :integer
  end
end
