class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_quality
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :product_explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '設定範囲外です。' }
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :product_category_id
    validates :product_quality_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :delivery_days_id
  end
  
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
end
