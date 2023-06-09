FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_kana       {'アイ'}
    last_name_kana        {'アイ'}
    birth_date            {Faker::Date.backward}
  end
end