class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :messages

  has_one_attached :photo
end
