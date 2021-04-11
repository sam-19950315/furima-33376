require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が正常にできる時' do
      it '出品画像、商品名、商品の説明、商品の詳細、配送について、販売価格（半角数字で、範囲が、300-9999999）の全ての項目が存在するとき' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が正常に行えない時' do
      it 'product_nameが空の時' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explantionがからの時' do
        @item.product_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product explanation can't be blank")
      end
      it 'product_category_idが0の時' do
        @item.product_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Product category must be other than 0')
      end
      it 'product_quality_idが0の時' do
        @item.product_quality_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Product quality must be other than 0')
      end
      it 'shipping_charges_idが0の時' do
        @item.shipping_charges_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges must be other than 0')
      end
      it 'prefecture_idが0の時' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'delivery_days_idが0の時' do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days must be other than 0')
      end
      it 'priceが半角数字でない時' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it 'priceが半角英数字混合の時' do
        @item.price = '3a3a3a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it 'priceが半角英字のみの時' do
        @item.price = 'aaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it 'priceが全角文字の時' do
        @item.price = 'アイウエオ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it 'priceが299円以下の時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 設定範囲外です。')
      end
      it 'priceが10000000円以上の時' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 設定範囲外です。')
      end
      it 'userが紐づいていいない時' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '出品画像が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
