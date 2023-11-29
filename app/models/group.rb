class Group < ApplicationRecord
  CATEGORIES = %w[Restaurants Bars Museums Shoppings Pubs Parks Random].sort + ['Random']

  belongs_to :user
  belongs_to :activity, optional: true
  has_many :members, dependent: :destroy

  validates :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }
end
