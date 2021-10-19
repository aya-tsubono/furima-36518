# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :buying_historys


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | integer    | null: false                    |
| area         | string     | null: false                    |
| days         | string     | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :buying_history


## buying_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| destination_full_name | string     | null: false                    |
| postcode              | integer    | null: false                    |
| address               | string     | null: false                    |
| phone_number          | bigint     | null: false                    |
| item_id               | references | null: false, foreign_key: true |

### Association

- belongs_to :buying_history