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

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_name (kana)  | string | null: false  |
| last_name (kana)   | string | null: false  |
| date               | string | null: false  |


### Association
- has_many :items
- has_many :purchases
- has_one  :sends



## items テーブル (商品情報)

| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| user                   | reference | null: false, foreign_key: true|
| category_id            | integer   | null: false |
| item_name              | string    | null: false |
| item_explanation       | text      | null: false |
| item_situation         | text      | null: false |
| item_price             | integer   | null: false |
| shipping_charges       | string    | null: false |
| shipping_origin region | text      | null: false |
| days_to_delivery       | integer   | null: false |




### Association
- has_many :users 
- has_one  :purchase



## purchases テーブル (購入履歴)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | unique: true, foreign_key: true|



### Association
- belong_to :user
- belong_to :item
- has_one   :sends 



## sends テーブル (発送先情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | references , foreign_key: true |
| email              | string  | unique: true, foreign_key: true |
| purchase_history   | string  | references , foreign_key: true |
| post_code          | string  | null: false |
| prefectures_id     | integer | null: false |
| municipalities     | string
| address            | string
| building_name      | string
| telephone_number   | string  | null: false |


### Association
- belong_to :purchase