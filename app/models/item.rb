class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_quality
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user
  has_one_attached :image


  validates :product_name, :string, presence: true
  validates :product_explanation, :text, presence: true
  validates :product_category_id, :numericality: { other_than: 1 }
  validates :product_quality_id, :numericality: { other_than: 1 }
  validates :shipping_charges_id, :numericality: { other_than: 1 }
  validates :prefecture_id, :numericality: { other_than: 1 }
  validates :delivery_days_id, :numericality: { other_than: 1 }
  validates :price, :integer, presence: true
end
