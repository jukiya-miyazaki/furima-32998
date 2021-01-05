# README
# テーブル設計

## users テーブル
<!-- ユーザー情報 -->

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false | <!-- メールアドレス -->
| encrypted_password | string  | null: false | <!-- パスワード -->
| nickname           | string  | null: false | <!-- ニックネーム -->
| first_name         | string  | null: false | <!-- 名前 -->
| last_name          | string  | null: false | <!-- 苗字 -->
| first_name_ruby    | string  | null: false | <!-- 名前フリガナ -->
| last_name_ruby     | string  | null: false | <!-- 苗字フリガナ -->
| birth_date         | integer | null: false | <!-- 生年月日 -->
### Association

- has_many :items
- has_many :records

## items テーブル
<!-- 商品情報 -->

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    | <!-- 商品名 -->
| product_description  | text       | null: false                    | <!-- 説明 -->
| product_category_id  | text       | null: false                    | <!-- カテゴリー -->
| product_condition_id | integer    | null: false                    | <!-- 状態 -->
| delivery_charge_id   | integer    | null: false                    | <!-- 配送料 -->
| prefectures_id       | integer    | null: false                    | <!-- 配送元 -->
| days_to_ship_id      | integer    | null: false                    | <!-- 発送までの日数 -->
| product_price        | integer    | null: false                    | <!-- 価格 -->
| user                 | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :record

## records テーブル
<!-- 購入記録 -->

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false  foreign_key: true | <!-- 商品情報/出品者 -->
| user   | references | null: false, foreign_key: true | <!-- 購入記録/購入者 -->
### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
<!-- 住所 -->

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    | <!-- 郵便番号 -->
| prefectures_id  | integer    | null: false                    | <!-- 都道府県 -->
| municipalities  | string     | null: false                    | <!-- 市町村 -->
| address         | string     | null: false                    | <!-- 番地 -->
| phone_number    | integer    | null: false                    | <!-- 電話番号 -->
| Building_number | string     | null: false                    | <!-- 建物番号 -->
| records         | references | null: false, foreign_key: true |
### Association

- belongs_to :record