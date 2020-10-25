FactoryBot.define do
  factory :item do
    name        {"棚"}
    price       {3000}
    explanation {Faker::Lorem.sentence}
    category_id        {2}
    status_id          {2}
    deal_fee_id        {2}
    prefecture_id      {2}
    delivery_period_id {2}
    association :user
  end
  #after(:build) do |item|
    #item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  #end
end