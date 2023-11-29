class Group < ApplicationRecord
  belongs_to :user
  belongs_to :activity, optional: true
  has_many :members, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user }
end
