class Group < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :name, presence: true
end
