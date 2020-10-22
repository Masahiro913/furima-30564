require 'date'
date_of_birth = DateTime.new(1996,8,19)
FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    last_name             {"昌宏"}
    first_name            {"小山"}
    last_name_kana        {"マサ"}
    first_name_kana       {"コヤマ"}
    birthday              {date_of_birth}
  end
end