class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_quality
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user
  has_one_attached :image


  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :product_category_id, numericality: { other_than: 1 }
  validates :product_quality_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_days_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { in: 300..9999999}, numericality: { only_integer: true }, format: { with: /\A[0-9]+\z/, message: "は、半角数字で入力してください。" }
  validates :image, presence: true
end
