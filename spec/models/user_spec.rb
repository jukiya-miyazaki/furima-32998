require 'rails_helper'
RSpec.describe User, type: :model do
   before do
      @user = FactoryBot.build(:user)
   end
   # binding.pry # /error_message 検出
   # bundle exec rspec spec/models/user_spec.rb 
   # @user.errors
   # @user.errors.full_messages
   
  describe 'ユーザー新規登録' do
    it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_ruby、last_name_ruby、birth_dateが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    # 以下 email
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailには@がなくては登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    # 以上 email

    # 以下 password
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが一致していても5文字以下では登録できない' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが一致していても数字のみでは登録できない' do
      @user.password = '0000000'
      @user.password_confirmation = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字混合での入力')
    end
    it 'passwordが一致していても英字のみでは登録できない' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字混合での入力')
    end
    it 'password_confirmationとpasswordは一致しないと登録できない' do
      @user.password_confirmation = '123456b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # 以上 password

    # 以下 name
    # 以下 first_name
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが半角ｶﾅでは登録できない' do
      @user.first_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'first_nameが半角数字では登録できない' do
      @user.first_name = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'first_nameが全角数字では登録できない' do
      @user.first_name = '１２３４５６'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'first_nameが半角英小字では登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'first_nameが全角英字では登録できない' do
      @user.first_name = 'ｔｅｓｕｔｏ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    # 以上 first_name
    # 以下 last_name
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが半角ｶﾅでは登録できない' do
      @user.last_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'last_nameが半角数字では登録できない' do
      @user.last_name = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'last_nameが全角数字では登録できない' do
      @user.last_name = '１２３４５６'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'last_nameが半角英小字では登録できない' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    it 'last_nameが全角英字では登録できない' do
      @user.last_name = 'ｔｅｓｕｔｏ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力')
    end
    # 以上 last_name
    # 以上 name

    # 以下 ruby
    # 以下 first_name_ruby
    it 'first_name_rubyが空では登録できない' do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end
    it 'first_name_rubyが半角ｶﾅでは登録できない' do
      @user.first_name_ruby = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby 全角（カタカナ）での入力')
    end
    it 'first_name_rubyが半角英小字では登録できない' do
      @user.first_name_ruby = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby 全角（カタカナ）での入力')
    end
    it 'first_name_rubyが全角英字では登録できない' do
      @user.first_name_ruby = 'ｔｅｓｕｔｏ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby 全角（カタカナ）での入力')
    end
    # 以上 first_name_ruby
    # 以下 last_name_ruby
    it 'last_name_rubyが空では登録できない' do
      @user.last_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end
    it 'last_name_rubyが半角ｶﾅでは登録できない' do
      @user.last_name_ruby = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby 全角（カタカナ）での入力')
    end
    it 'last_name_rubyが半角英小字では登録できない' do
      @user.last_name_ruby = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby 全角（カタカナ）での入力')
    end
    it 'last_name_rubyが全角英字では登録できない' do
      @user.last_name_ruby = 'ｔｅｓｕｔｏ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby 全角（カタカナ）での入力')
    end
    # 以上 ruby

    # 以下 birth_date
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    # 以上 birth_date
  end
end