class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups, dependent: :destroy
  has_one_attached :photo
  
  validates :last_name, :first_name, :address, presence: true

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
end
