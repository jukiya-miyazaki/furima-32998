class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postal_code,     null: false # 郵便番号
      t.integer  :prefecture_id,   null: false # 都道府県
      t.string   :municipalities,  null: false # 市町村
      t.string   :address,         null: false # 番地
      t.string   :phone_number,    null: false # 電話番号
      t.string   :building_number              # 建物番号

      t.references :record,        foreign_key: true # 外部キー

      t.timestamps
    end
  end
end
