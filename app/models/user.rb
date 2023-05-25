class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :birth_date,         presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
 

  has_many :items
  has_many :purchases


end


