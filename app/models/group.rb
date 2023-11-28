class Group < ApplicationRecord
  belongs_to :user
  belongs_to :activity, optional: true
  validates :name, presence: true, uniqueness: { scope: :user }
end
