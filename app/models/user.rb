class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください' 
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角ひらがな、全角カタカナ、全角漢字で記入してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角ひらがな、全角カタカナ、全角漢字で記入してください" }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: "全角カタカナで記入してください" }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: "全角カタカナで記入してください" }
  validates :birthday, presence: true


  
end
