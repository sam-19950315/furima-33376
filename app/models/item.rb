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
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
    validates :image
  end
  validates :product_category_id, numericality: { other_than: 1 }
  validates :product_quality_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :delivery_days_id, numericality: { other_than: 1 }
end
