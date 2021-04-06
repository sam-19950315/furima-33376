class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string              :prdouct                 , null: false
      t.text                :product_explanation     , null: false
      t.integer             :product_category_id     , null: false
      t.integer             :product_quality_id      , null: false
      t.integer             :prefecture_id           , null: false
      t.integer             :delivery_days_id        , null: false
      t.integer             :price                   , null: false
      t.references          :user                    , foreign_key: true
      t.timestamps
    end
  end
end
