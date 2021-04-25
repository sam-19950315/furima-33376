class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id or Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    else
      @order_purchase = OrderPurchase.new
    end
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
      if @order_purchase.valid?
        @order_purchase.save
        redirect_to root_path
      else
        render action: :index  
      end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:postal_code, :prefecture_id, :manicipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
