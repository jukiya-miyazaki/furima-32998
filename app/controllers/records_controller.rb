class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.record.present?
      # カレントユーザーがitemの出品者だったらまずい
      # 売却済みの商品だったらまずい
      redirect_to root_path
    else
      @record_ho = HomeObject.new
    end
  end

  # create = new + save
  def create
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
  # permit = 記入した
  # merge = 参照したい値
  def homeobject_params
    params.require(:home_object).permit(:postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
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
