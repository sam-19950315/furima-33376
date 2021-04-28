require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @order = FactoryBot.build(:order_purchase)
    @order.user_id = @user.id
    @order.item_id = @item.id
  end

  describe '購入者情報登録' do
    context '購入者登録が正常にできる時' do
      it '郵便番号(ハイフンあり)、都道府県、市区町村、番地、建物名、電話番号(ハイフンなし),
      token、user_id、item_idが入力されている場合' do
        expect(@order).to be_valid
      end
      it '郵便番号(ハイフンあり)、都道府県、市区町村、番地、電話番号(ハイフンなし)、token、user_id、item_idが入力されている場合' do
        @order.building_name = ""
        expect(@order).to be_valid
      end

    end
    context '購入者登録が正常にできない時' do
      it 'user_idが存在しないとき' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないとき' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが存在しないとき' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が存在しないとき' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンなしの場合' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code は、3桁数字-4桁数字のハイフンありで記載してください。")
      end
      it '郵便番号の桁数が2桁-4桁の場合' do
        @order.postal_code = '12-4567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code は、3桁数字-4桁数字のハイフンありで記載してください。")
      end
      it '郵便番号の桁数が3桁-3桁の場合' do
        @order.postal_code = '123-456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code は、3桁数字-4桁数字のハイフンありで記載してください。")
      end
      it 'Prefectureの番号が0の時' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が存在しないとき' do
        @order.manicipality = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Manicipality can't be blank")
      end
      it '番地が存在しないとき' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が存在しないとき' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号の桁数が9桁の場合' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は、-なしの10桁か11桁で記入してください。")
      end
      it '電話番号の桁数が12桁の場合' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は、-なしの10桁か11桁で記入してください。")
      end
      it '電話番号の-が存在するとき' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は、-なしの10桁か11桁で記入してください。")
      end
    end
  end
end
