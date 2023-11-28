class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  validates :last_name, :first_name, :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end
