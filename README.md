#テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false,             |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |
| last_name             | string | null: false              |
| first_name            | string | null: false              |
| last_name_katakana    | string | null: false              |
| first_name_katakana   | string | null: false              |
| birthday              | date   | null: false              |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type      | Options           |
| -------------------  | --------- | ----------------  |
| product_name         | string    | null: false       |
| product_explantion   | text      | null: false       |
| product_category_id  | integer   | null: false       |
| product_quality_id   | integer   | null: false       |
| shipping_charges_id  | integer   | null: false       |
| prefecture_id        | integer   | null: false       |
| delivery_days_id     | integer   | null: false       |
| price                | integer   | null: false       |
| user                 | references| foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## orders テーブル

| Column                  | Type      | Options           |
| ----------------------  | --------- | ----------------  |
| postal_code             | string    | null: false       |
| prefecture_id           | integer   | null: false       |
| manicipality            | string    | null: false       |
| address                 | string    | null: false       |
| building_name           | string    |                   |
| phone_number            | string    | null: false       |
| purchase                | references| foreign_key: true |


### Association

- belongs_to :purchase


## purchases テーブル

| Column | Type      | Options           |
| -----  | --------- | ----------------  |
| item   | references| foreign_key: true |
| user   | references| foreign_key: true |


### Association

- belong_to :user
- belong_to :item
- has_one :order