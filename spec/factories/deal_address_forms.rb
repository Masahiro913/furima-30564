FactoryBot.define do
  factory :deal_address_form do
    post_number      {"300-4756"}
    prefecture_id   {2}
    city_town       {"横浜市緑区"}
    addressline     {"青山1-1-1"}
    building_name   {"柳ビル103"}
    tell_buyer      {"09012345678"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
