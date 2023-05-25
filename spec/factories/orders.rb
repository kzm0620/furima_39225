FactoryBot.define do
  factory :order do
    token              {"tok_abcdefghijk00000000000000000"}
    post_code          {'123-4567'}
    prefecture_id      {'1'}
    municipalities     {"東京都"}
    address            {'1-1'}
    building_name      {'東京ハイツ'}
    telephone_number   {'12345678912'} 

  end
end