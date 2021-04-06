class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_explanation, :product_category_id, :product_quality_id, :shipping_charges_id, :prefecture_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
