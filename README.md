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
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name ()      | string | null: false |
| last_name ()       | string | null: false |
| date of birth      | string | null: false |


### Association
- has_many :items
- has_many :purchases
- has_one  :sends 



## items テーブル (商品情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| user               | string    | null: false, foreign_key: true|
| category           | text    | null: false |
| item_name          | string  | null: false |
| item_explanation   | text    | null: false |
| item_situation     | text    | null: false |
| item_price         | integer | null: false |
| Shipping charges   | string   | null: false |
| Shipping origin region         | text     | null: false |
| Days to delivery   | integer | null: false |




### Association
- has_many :users 
- has_one  :purchases



## purchases テーブル (購入履歴)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false, foreign_key: true |
| email              | string  | null: false, foreign_key: true|
| item_name          | string  | null: false, foreign_key: true |
| item_explanation   | text    | null: false, foreign_key: true |
| item_price         | integer | null: false, foreign_key: true |


### Association
- belong_to :users
- belong_to :items
- has_one   :sends 



## sends テーブル (発送先情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false, foreign_key: true |
| email              | string  | null: false, foreign_key: true |
| Purchase history   | string  | null: false, foreign_key: true |
| post code          | strin  | null: false |
| prefectures        | string | null: false |
| municipalities     | string   | null: false |
| address            | string  | null: false |
| Building name      | string  |  null: false |
| telephone number   | integer | null: false |


### Association
- belong_to :users
- belong_to :purchases