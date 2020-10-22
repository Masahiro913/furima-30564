class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates_uniqueness_of :email
    validates :password, format: { with: /\A[a-z0-9]+\z/i} 
    validates :nickname

    with_options format: {with: /\A[ぁ-んァ-ヶー一-龠]+\Z/} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\Z/} do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end

has_many :items
has_many :deals
end