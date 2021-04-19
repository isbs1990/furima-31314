class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# validate記述
# with_options presence: true do
    validates :nickname, presence: true
    validates :knj_first_name, presence: true
    validates :knj_last_name, presence: true
    validates :kana_first_name, presence: true
    validates :kana_last_name, presence: true
    validates :birth_day, presence: true
end