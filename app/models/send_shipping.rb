class SendShipping < ApplicationRecord

  # validates  :purchase,           presence: true
  # validates  :post_code,          presence: true
  # validates  :prefecture_id,      presence: true
  # validates  :municipalities,     presence: true
  # validates  :address,            presence: true
  # validates  :building_name,      presence: true
  # validates  :telephone_number,   presence: true


  belongs_to :purchase


  
end
