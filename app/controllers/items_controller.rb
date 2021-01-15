class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(id: 'DESC')
    # idをDESC（降順）新しい物が一番上
    # 反対（昇順）はASC
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :product_price, :product_category_id,
                                 :product_condition_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
