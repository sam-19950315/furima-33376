class AddShippingChargesIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipping_charges_id, :integer
  end
end
