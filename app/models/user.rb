class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  validates :last_name, :first_name, :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
