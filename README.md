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
| birthday         | date   | null: false |

### association
has_many : items
has_many : deals

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | int        | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | int        | null: false                    |
| status_id          | int        | null: false                    |
| deal_fee_id        | int        | null: false                    |
| prefecture_id      | int        | null: false                    |
| delivery_period_id | int        | null: false                    |
| user               | references | null: false, foreign_key: true |

### association
has_one    :deal
belongs_to :user

## dealsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### association
has_one    :address
belongs_to :user
belongs_to :item

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefecture_id   | int        | null: false                    |
| city_town       | string     | null: false                    |
| addressline     | string     | null: false                    |
| building_name   | string     |                                |
| deal            | references | null: false, foreign_key: true |
| tell_buyer      | int        | null: false                    |


### association
belongs_to :deal