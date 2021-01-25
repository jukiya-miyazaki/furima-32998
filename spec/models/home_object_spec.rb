require 'rails_helper'

RSpec.describe HomeObject, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @home_object = FactoryBot.build(:home_object, user_id: @user.id , item_id: @item.id)
   end
  # binding.pry # /error_message 検出
  # bundle exec rspec spec/models/home_object_spec.rb
  # @home_object.errors
  # @home_object.errors.full_messages

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@home_object).to be_valid
      end
    end

    context '商品の購入ができない時とき' do
      # postal_code
      it 'postal_codeが空だと購入出来ない' do
        @home_object.postal_code = ''
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが数字のみだと購入出来ない' do
        @home_object.postal_code = 1_231_234
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Postal code を入力してください')
      end
      it 'postal_codeのハイフンの前は3桁で無いと購入出来ない' do
        @home_object.postal_code = '12-1234'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Postal code を入力してください')
      end
      it 'postal_codeのハイフンの前は3桁で無いと購入出来ない' do
        @home_object.postal_code = '1234-1234'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Postal code を入力してください')
      end
      it 'postal_codeのハイフンの後は4桁で無いと購入出来ない' do
        @home_object.postal_code = '123-123'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Postal code を入力してください')
      end
      it 'postal_codeのハイフンの後は4桁で無いと購入出来ない' do
        @home_object.postal_code = '123-12345'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Postal code を入力してください')
      end
      # postal_code

      # prefecture_id
      it 'prefecture_idが空だと購入出来ない' do
        @home_object.prefecture_id = nil
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと保存できない' do
        @home_object.prefecture_id = 1
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Prefecture を入力してください')
      end
      # prefecture_id

      # municipalities
      it 'municipalitiesが空だと購入出来ない' do
        @home_object.municipalities = ''
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Municipalities can't be blank")
      end
      # municipalities

      # address
      it 'addressが空だと購入出来ない' do
        @home_object.address = ''
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Address can't be blank")
      end
      # address

      # phone_number
      it 'phone_numberが空だと購入出来ない' do
        @home_object.phone_number = ''
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁だと購入出来ない' do
        @home_object.phone_number = '123451234512'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Phone number を入力してください')
      end
      it 'phone_numberが10桁だと購入出来ない' do
        @home_object.phone_number = '1234512345'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Phone number を入力してください')
      end
      it 'phone_numberに-があると購入出来ない' do
        @home_object.phone_number = '123-1234-1234'
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include('Phone number を入力してください')
      end
      # phone_number

      # token
      it 'tokenが空だと購入出来ない' do
        @home_object.token = ''
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Token can't be blank")
      end
      # token

      # user_id,item_id
      it 'user_idが空だと登録できない' do
        @home_object.user_id = nil
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @home_object.item_id = nil
        @home_object.valid?
        expect(@home_object.errors.full_messages).to include("Item can't be blank")
      end
      # user_id,item_id
    end
  end
end
