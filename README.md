# テーブル設計

## usersテーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | int    | null: false |

### association
has_many : items
has_many : deals

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | int        | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| deal_fee        | int        | null: false                    |
| region          | string     | null: false                    |
| delivery_period | int        | null: false                    |
| user            | references | null: false, foreign_key: true |

### association
has_one    :deal
belongs_to :user

## dealsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tell_buyer | int        | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### association
has_one    :address
belongs_to :users
belongs_to :items

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | int        | null: false                    |
| prefecture      | string     | null: false                    |
| city_town       | string     | null: false                    |
| addressline     | string     | null: false                    |
| building_name   | string     | null: false                    |
| deal            | references | null: false, foreign_key: true |

### association
belongs_to :deals