class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
  validates :first_name_kana,    presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :last_name_kana,     presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :birth_date,         presence: true


 

  # has_many :items
  # has_many :purchases

end
