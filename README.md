# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル (商品情報)

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| ニックネーム         | string | null: false |
| メールアドレス       | string | null: false |
| パスワード           | string | null: false |
| 姓                 | string | null: false |
| 名                 | string | null: false |
| 姓 (フリガナ)       | string | null: false |
| 名 (フリガナ)       | string | null: false |
| 生年月日            | string | null: false |


### Association
- has_many :items
- has_many :purchases
- has_one  :sends 



## items テーブル (商品情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| ユーザー             | string    | null: false, foreign_key: true|
| カテゴリー           | text    | null: false |
| 商品名              | string  | null: false |
| 商品説明             | text    | null: false |
| 商品の状態           | text    | null: false |
| 商品価格             | integer | null: false |
| 配送料の負担         | string   | null: false |
| 発送元の地域         | text     | null: false |
| 発送までの日数        | integer | null: false |




### Association
- has_many :users 
- has_one  :purchases



## purchases テーブル (購入履歴)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| ニックネーム         | string  | null: false, foreign_key: true |
| email              | string  | null: false, foreign_key: true|
| 商品名              | string  | null: false, foreign_key: true |
| 商品説明             | text    | null: false, foreign_key: true |
| 価格                | integer | null: false, foreign_key: true |


### Association
- belong_to :users
- belong_to :items
- has_one   :sends 



## sends テーブル (発送先情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| ニックネーム         | string  | null: false, foreign_key: true |
| email              | string  | null: false, foreign_key: true |
| 購入履歴             | string  | null: false, foreign_key: true |
| 郵便番号             | strin  | null: false |
| 都道府県             | string | null: false |
| 市区町村             | string   | null: false |
| 番地                | string  | null: false |
| 建物名              | string  |  null: false |
| 電話番号             | integer | null: false |


### Association
- belong_to :users
- belong_to :purchases