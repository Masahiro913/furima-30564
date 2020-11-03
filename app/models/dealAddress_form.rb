class DealAddressForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city_town, :addressline, :building_name, :tell_buyer, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {greater_than_or_equal_to: 2}
    validates :city_town
    validates :addressline
    validates :tell_buyer, length: { maximum: 11 }
    validates :token
  end

  def save
    deal = Deal.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city_town: city_town, addressline: addressline, building_name: building_name, tell_buyer: tell_buyer, deal_id: deal.id)
  end

end