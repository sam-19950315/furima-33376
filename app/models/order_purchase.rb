class OrderPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with:  /\A[0-9]{3}-[0-9]{4}\z/, message: "は、3桁数字-4桁数字のハイフンありで記載してください。" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :manicipality
    validates :address
    validates :phone_number, format: { with:  /\A\d{10}$|^\d{11}\z/, message: "は、-なしの10桁か11桁で記入してください。"}
  end

  def save
    purchase  =  Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, manicipality: manicipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end