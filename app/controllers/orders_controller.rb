class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    else
      @order_purchase = OrderPurchase.new
    end
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
      if @order_purchase.valid?
        pay_item
        @order_purchase.save
        redirect_to root_path
      else
        render action: :index  
      end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:postal_code, :prefecture_id, :manicipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
