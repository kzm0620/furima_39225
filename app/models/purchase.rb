class Purchase < ApplicationRecord

  # validates :user,    presence: true
  # validates :item,    presence: true


  belongs_to :user
  belongs_to :item
  has_one    :send_shipping



end