class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery


  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_situation_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,       numericality: { other_than: 1 , message: "can't be blank"}

  
  validates :category_id,         presence: true
  validates :item_name,           presence: true
  validates :item_explanation,    presence: true
  validates :item_situation_id,   presence: true
  validates :item_price,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  validates :shipping_charge_id,  presence: true
  validates :delivery_id,         presence: true
  validates :prefecture_id,       presence: true
  validates :image,               presence: true


  has_one_attached :image
  belongs_to       :user
  has_one          :purchase


end
