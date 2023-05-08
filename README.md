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


### Association
- has_many :items
- has_many :purchases
- has_one  :sends 



## items テーブル (商品情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item_name          | string  | null: false |
| item_explanation   | string  | null: false |
| item_detail        | text    | null: false |
| delivery           | text    | null: false |
| price              | integer | null: false |


### Association
- has_many :users
- has_one  :purchases



## purchases テーブル (購入履歴)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| item_name          | string  | null: false |
| item_explanation   | text    | null: false |
| item_detail        | text    | null: false |
| price              | integer | null: false |


### Association
- belong_to :users
- belong_to :items
- has_one   :sends 



## sends テーブル (発送先情報)

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| address            | text    | null: false |


### Association
- belong_to :users
- belong_to :purchases