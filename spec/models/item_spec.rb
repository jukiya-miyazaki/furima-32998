require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  # binding.pry # /error_message 検出
  # bundle exec rspec spec/models/item_spec.rb
  # @item.errors
  # @item.errors.full_messages

  describe '出品登録' do
    context '出品登録がうまくいくとき' do
      it 'image、product_name、product_description、product_price、product_category_id、product_condition_id、delivery_charge_id、prefecture_id、days_to_ship_idが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it 'product_nameが空だと保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_descriptionが空だと保存できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      # 以下 価格
      it 'product_priceが空だと保存できない' do
        @item.product_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it 'product_priceが300円未満だと保存できない' do
        @item.product_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price must be greater than or equal to 300')
      end
      it 'product_priceが10,000,000円以上だと保存できない' do
        @item.product_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price must be less than or equal to 9999999')
      end
      # 以上 価格
      # 以下 カテゴリー
      it 'product_category_idが空だと保存できない' do
        @item.product_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Product category is not a number')
      end
      it 'product_category_idが1だと保存できない' do
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product category must be other than 1')
      end
      # 以上 カテゴリー
      # 以下 状態
      it 'product_condition_idが空だと保存できない' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition is not a number')
      end
      it 'product_condition_idが1だと保存できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 1')
      end
      # 以上 状態
      # 以下 配送料
      it 'delivery_charge_idが空だと保存できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end
      it 'delivery_charge_idが1だと保存できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
      end
      # 以上 配送料
      # 以下 配送元
      it 'prefecture_idが空だと保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      # 以上 配送元
      # 以下 発送までの日数
      it 'days_to_ship_idが空だと保存できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship is not a number')
      end
      it 'days_to_ship_idが1だと保存できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      # 以上 発送までの日数
    end
  end
end
