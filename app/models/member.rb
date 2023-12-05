class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :messages, dependent: :destroy

  has_one_attached :photo
end
