class RenamePrdouctColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :prdouct, :product_name
  end
end
