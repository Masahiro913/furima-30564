class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email
  
  validates :password, format: { with: /\A[a-z0-9]+\z/i} 
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶー一-龠]+\Z/}                #全角のみ
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶー一-龠]+\Z/}               #全角のみ
  validates :last_name_kana, presence: true, format: {with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\Z/}   #全角カナのみ
  validates :first_name_kana, presence: true, format: {with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\Z/}  #全角カナのみ
  validates :birthday, presence: true

has_many :items
has_many :deals
end