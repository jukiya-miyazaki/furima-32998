# README
# テーブル設計

## users テーブル
<!-- ユーザー情報 -->

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false | <!-- メールアドレス -->
| password   | string | null: false | <!-- パスワード -->
| nickname   | string | null: false | <!-- ニックネーム -->

### Association

- has_many :items
- has_many :records

## items テーブル
<!-- 商品情報 -->

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    | <!-- 商品名 -->
| product_description | text       | null: false                    | <!-- 説明 -->
| product_category    | text       | null: false                    | <!-- カテゴリー -->
| product_image       |            | null: false                    | <!-- 画像 -->
| product_condition   | text       | null: false                    | <!-- 状態 -->
| delivery_charge     | string     | null: false                    | <!-- 配送料 -->
| shipping_area       | text       | null: false                    | <!-- 配送元 -->
| days_to_ship        | string     | null: false                    | <!-- 発送までの日数 -->
| product_price       | string     | null: false                    | <!-- 価格 -->
| user                | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :record

## records テーブル
<!-- 購入記録 -->

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false  foreign_key: true | <!-- 商品情報/出品者 -->
| user                | references | null: false, foreign_key: true | <!-- 購入記録/購入者 -->
### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
<!-- 住所 -->

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    | <!-- 郵便番号 -->
| prefectures    | string     | null: false                    | <!-- 都道府県 -->
| municipalities | string     | null: false                    | <!-- 市町村 -->
| address        | string     | null: false                    | <!-- 番地 -->
| phone number   | string     | null: false                    | <!-- 電話番号 -->

### Association

- belongs_to :record