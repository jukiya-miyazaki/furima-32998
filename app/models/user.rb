class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items,   dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname # ニックネーム
    validates :birth_date # 生年月日
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）での入力' } do
      validates :first_name # 名前
      validates :last_name # 苗字
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）での入力' } do
      validates :first_name_ruby # 名前フリガナ
      validates :last_name_ruby # 苗字フリガナ
    end
    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字混合での入力' } do
      validates :password # パスワード
    end
  end
end
