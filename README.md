#テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name(katakana)   | string | null: false |
| first_name(katakana)  | string | null: false |
| birthday(year)        | numeric| null: false |
| birthday(month)       | numeric| null: false |
| birthday(date)        | numeric| null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column               | Type      | Options           |
| -------------------  | --------- | ----------------  |
| product_image        | string    | null: false       |
| product_name         | string    | null: false       |
| product_explantion   | text      | null: false       |
| product_category     | string    | null: false       |
| product_quality      | string    | null: false       |
| shipping_charges     | string    | null: false       |
| delivery_area        | string    | null: false       |
| delivery_days        | string    | null: false       |
| price                | numeric   | null: false       |
| fee                  | numeric   | null: false       |
| profit               | numeric   | null: false       |
| user_id              | references| foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column                  | Type      | Options           |
| ----------------------  | --------- | ----------------  |
| credit_card_information | numeric   | null: false       |
| expiration_date_month   | numeric   | null: false       |
| expiration_date_year    | numeric   | null: false       |
| security_code           | numeric   | null: false       |
| postal_code             | string    | null: false       |
| prefectures             | string    | null: false       |
| manicipality            | string    | null: false       |
| address                 | string    | null: false       |
| building_name           | string    | null: false       |
| phone_number            | numeric   | null: false       |
| user_id                 | references| foreign_key: true |
| item_id                 | references| foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item