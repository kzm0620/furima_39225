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

| Column             | Type     | Options      |
| ------------------ | -------- | ------------ |
| nickname           | string   | null: false  |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false  |
| first_name         | string   | null: false  |
| last_name          | string   | null: false  |
| first_name_kana    | string   | null: false  |
| last_name_kana     | string   | null: false  |
| birth_date               | date     | null: false  |


### Association
- has_many :items
- has_many :purchases



## item テーブル (商品情報)

| Column                    | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| user                      | references | null: false, foreign_key: true|
| category_id               | integer    | null: false |
| item_name                 | string     | null: false |
| item_explanation          | text       | null: false |
| item_situation_id         | integer    | null: false |
| item_price                | integer    | null: false |
| shipping_charge_id        | integer    | null: false |
| shipping_origin_id        | integer    | null: false |
| days_to_delivery_id       | integer    | null: false |
| prefecture_id             | integer    | null: false |




### Association
- belongs_to :user
- has_one    :purchase



## purchases テーブル (購入履歴)

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| user  | references | null: false, foreign_key: true|
| item  | references | null: false, foreign_key: true|




### Association
- belongs_to :user
- belongs_to :item
- has_one   :send



## send_shippings テーブル (発送先情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| purchases          | string  | null: false, foreign_key: true |
| post_code          | string  | null: false |
| prefecture_id      | integer | null: false |
| municipalities     | string  | null: false |
| address            | string  | null: false |
| building_name      | string  |
| telephone_number   | string  | null: false |


### Association
- belongs_to :purchase