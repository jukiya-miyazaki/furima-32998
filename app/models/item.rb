class Item < ApplicationRecord
  with_options presence: true do
    validates :image               # 画像
    validates :product_name        # 商品名
    validates :product_description # 説明

    validates :product_price, numericality: { only_integer: true } # 価格
    validates :product_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } # 価格制限
  end

  with_options numericality: { other_than: 1 } do
    validates :product_category_id  # カテゴリー
    validates :product_condition_id # 状態
    validates :delivery_charge_id   # 配送料
    validates :prefecture_id        # 配送元
    validates :days_to_ship_id      # 発送までの日数
  end
  belongs_to :user
  has_one_attached :image
  # 商品テーブルとActiveStorageのアソシエーション

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
end
