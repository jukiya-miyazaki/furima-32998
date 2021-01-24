class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    # @record = Record.find_by(item_id: @item.id)
    if current_user.id == @item.user_id && @item.record.present?
      # カレントユーザーがitemの出品者だったら
      # 売却済みの商品だったら
      redirect_to root_path
    else
      @record_ho = HomeObject.new
    end
  end

  # create = new + save
  def create
    @item = Item.find(params[:item_id])
    @record_ho = HomeObject.new(homeobject_params)
    if @record_ho.valid?
      pay_item
      @record_ho.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def homeobject_params
    params.require(:home_object).permit(:item_id, :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # テスト秘密鍵
    Payjp::Charge.create(
      amount: @item[:product_price], # 商品の値段
      card: homeobject_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
