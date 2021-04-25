class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find, only: [:show, :edit, :update, :destroy]
  before_action :security, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    end 
  end

  def update
    if Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    end 
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_explanation, :product_category_id, :product_quality_id,
                                 :shipping_charges_id, :prefecture_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def find
    @item = Item.find(params[:id])
  end

  def security
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
