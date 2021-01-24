class HomeObject
  include ActiveModel::Model
  # 記入されるべき情報の一覧
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building_number,
                :token

  # バリデーションの処理
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'を入力してください' }
    # 郵便番号
    validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
    # 都道府県
    validates :municipalities
    # 市町村
    validates :address
    # 番地
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'を入力してください' }
    # 電話番号
    validates :token
  end

  # 各テーブルにデータを保存する処理
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    # 1.recordテーブルの情報を完成させる
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                   phone_number: phone_number, building_number: building_number, record_id: record.id)
    # 2.完成したrecordsテーブルのrecord.idを元に、
    # 不足していたaddressesテーブルのrecord_idを埋める
  end
end
