class Order

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :post_code, :municipalities, :address, :building_name, :telephone_number, :token


  with_options presence: true do
    validates   :user_id            
    validates   :item_id
    validates   :post_code,          format:   {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates   :municipalities
    validates   :address
    validates   :telephone_number,   format:   {with: /\A\d{10,11}\z/, message: "10桁以上11桁以内の半角数値のみ保存可能なこと"}
    validates   :token
  end

    validates   :prefecture_id,      numericality:  {other_than: 0, message: "can't be blank"}
  
  
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    SendShipping.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end


end

