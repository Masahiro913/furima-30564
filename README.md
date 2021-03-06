# URL
https://furima-30564.herokuapp.com/

# アプリケーション概要
https://docs.google.com/document/d/1LbRP7wi8EansDWHNDsASjaIL9sj2qM3l7YxODmvR10I/edit
アクセスには認証IDとパスワードが必要のため上記の概要に記載してあります。

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
| tell_buyer      | string     | null: false                    |
| deal            | references | null: false, foreign_key: true |


### association
belongs_to :deal