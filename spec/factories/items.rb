FactoryBot.define do
  factory :item do
    association :user
    category_id          {4}
    item_name            {"test"}
    item_explanation     {"test"}
    item_situation_id    {2}
    item_price           {10000}
    shipping_charge_id   {3}
    days_to_delivery_id  {2}
    prefecture_id        {47}
    
    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
    
  end
end
