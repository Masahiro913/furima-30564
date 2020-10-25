class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deal_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_period

  with_options presence: true do
    validates :image
    validates :name
    validates :price
    validates :explanation
    #以下actiive_hashのバリデーション
    validates :category_id
    validates :status_id
    validates :deal_fee_id
    validates :prefecture_id
    validates :delivery_period_id
  end

  with_options numericality: {greater_than_or_equal_to: 2} do
    validates :category_id
    validates :status_id
    validates :deal_fee_id
    validates :prefecture_id
    validates :delivery_period_id
  end

  validates :price, numericality: {greater_than_or_equal_to: 300}
  validates :price, numericality: {less_than_or_equal_to: 9999999}
  validates :price, format: {with: /[0-9]/}

  belongs_to :user
  has_one    :deal
  has_one_attached :image
end
