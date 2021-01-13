class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,         null: false
      # 商品名
      t.text    :product_description,  null: false
      # 説明
      t.integer :product_category_id,  null: false
      # カテゴリー
      t.integer :product_condition_id, null:false
      # 状態
      t.integer :delivery_charge_id,   null: false
      # 配送料
      t.integer :prefecture_id,        null: false
      # 配送元
      t.integer :days_to_ship_id,      null: false
      # 発送までの日数
      t.integer :product_price,        null: false
      # 価格

      t.references  :user,             foreign_key: true
      # 外部キー

      t.timestamps
    end
  end
end
